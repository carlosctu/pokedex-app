import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokedex/pokedex_list_response.dart';
import 'package:dio/dio.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokedex/pokedex_response.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_details_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokedexRepository {
  final _dio = Dio();

  static const pokedexCacheKey = 'pokedex_list';
  static const pokemonCacheKey = 'pokemon_details';

  Future<void> saveDataToCache(Map<String, dynamic> dataMap, String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonData = jsonEncode(dataMap);
    await sharedPreferences.setString(key, jsonData);
  }

  Future getPokemonDetailsList(PokedexListResponse pokedexList) async {
    List<PokemonDetailsResponse?> pokemonModel = await Future.wait(
      pokedexList.results.map((pokemon) async {
        if (pokemon.url != null) {
          return getPokemonDetails(pokemon.url!);
        }
      }).toList(),
    );

    return pokemonModel.whereType<PokemonDetailsResponse>().toList();
  }

  Future<PokedexResponse> getPokedexList({
    required int offset,
    required int limit,
  }) async {
    final queryParameters = {
      "offset": offset,
      "limit": limit,
    };
    try {
      late PokedexListResponse pokedexList;
      Map<String, dynamic> cacheData = {};
      final sharedPreferences = await SharedPreferences.getInstance();
      final cachedData = sharedPreferences.getString(pokedexCacheKey);

      if (cachedData != null) {
        dynamic result;
        final decodedData = jsonDecode(cachedData) as Map<String, dynamic>;
        final pokemonsList = decodedData['results'] as List;
        final pokemonResult = pokemonsList.length >= limit;
        if (pokemonResult) {
          result = {
            "count": decodedData['count'],
            "next": decodedData['next'],
            "results": pokemonsList.sublist(offset, limit)
          };
          debugPrint("Got data from cache!");
        } else {
          final response = await _dio.get(
            'https://pokeapi.co/api/v2/pokemon',
            queryParameters: queryParameters,
          );
          result = response.data;
          cacheData = {
            "count": decodedData['count'],
            "next": decodedData['next'],
            "results": decodedData['results'] + result['results']
          };
          await saveDataToCache(cacheData, pokedexCacheKey);
        }
        pokedexList = PokedexListResponse.fromJson(result);
      } else {
        final result = await _dio.get(
          'https://pokeapi.co/api/v2/pokemon',
          queryParameters: queryParameters,
        );

        if (!sharedPreferences.containsKey(pokedexCacheKey)) {
          await saveDataToCache(result.data, pokedexCacheKey);
          debugPrint("Data Saved");
        }

        pokedexList = PokedexListResponse.fromJson(result.data);
      }

      return PokedexResponse(
        pokemonDetails: await getPokemonDetailsList(pokedexList),
      );
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Future<PokemonDetailsResponse> getPokemonDetails(String path) async {
    try {
      final result = await _dio.get(path);
      return PokemonDetailsResponse.fromJson(result.data);
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
