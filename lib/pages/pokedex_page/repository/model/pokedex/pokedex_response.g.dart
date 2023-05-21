// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokedexResponse _$PokedexResponseFromJson(Map<String, dynamic> json) =>
    PokedexResponse(
      pokemonDetails: (json['pokemonDetails'] as List<dynamic>)
          .map(
              (e) => PokemonDetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokedexResponseToJson(PokedexResponse instance) =>
    <String, dynamic>{
      'pokemonDetails': instance.pokemonDetails,
    };
