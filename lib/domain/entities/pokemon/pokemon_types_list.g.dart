// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_types_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonTypesList _$PokemonTypesListFromJson(Map<String, dynamic> json) =>
    PokemonTypesList(
      slot: json['slot'] as int?,
      type: json['type'] == null
          ? null
          : PokemonType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypesListToJson(PokemonTypesList instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
