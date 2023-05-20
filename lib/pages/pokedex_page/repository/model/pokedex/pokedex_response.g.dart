// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokedexResponse _$PokedexResponseFromJson(Map<String, dynamic> json) =>
    PokedexResponse(
      count: json['count'] as int,
      next: json['next'] as String,
      pokemonDetails: (json['pokemonDetails'] as List<dynamic>)
          .map(
              (e) => PokemonDetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokedexResponseToJson(PokedexResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'pokemonDetails': instance.pokemonDetails,
    };
