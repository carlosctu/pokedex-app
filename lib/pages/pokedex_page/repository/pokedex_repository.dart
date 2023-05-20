import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokedex/pokedex_list_response.dart';
import 'package:dio/dio.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokedex/pokedex_response.dart';

class PokedexRepository {
  final _dio = Dio();

  Future<PokedexResponse> getPokedexList() async {
    const offset = '20';
    const limit = '20';
    final queryParameters = {
      "offset": offset,
      "limit": limit,
    };
    try {
      final result = await _dio.get(
        'https://pokeapi.co/api/v2/pokemon',
        queryParameters: queryParameters,
      );

      final pokedexList = PokedexListResponse.fromJson(result.data);

      final pokemonModel = await Future.wait(
        pokedexList.results.map((pokemon) async {
          return getPokemonDetails(pokemon.url);
        }).toList(),
      );

      return PokedexResponse(
        count: pokedexList.count,
        next: pokedexList.next,
        pokemonDetails: pokemonModel,
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