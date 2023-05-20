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
              (e) => PokedexDetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokedexListResponseToJson(
        PokedexListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'results': instance.results,
    };

PokedexDetailsResponse _$PokedexDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PokedexDetailsResponse(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PokedexDetailsResponseToJson(
        PokedexDetailsResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
