// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokedexListResponse _$PokedexListResponseFromJson(Map<String, dynamic> json) =>
    PokedexListResponse(
      count: json['count'] as int,
      next: json['next'] as String,
      results: (json['results'] as List<dynamic>)
          .map(
              (e) => PokemonDetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokedexListResponseToJson(
        PokedexListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'results': instance.results,
    };

PokemonDetailsResponse _$PokemonDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailsResponse(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PokemonDetailsResponseToJson(
        PokemonDetailsResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
