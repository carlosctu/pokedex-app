// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stats_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonStatsList _$PokemonStatsListFromJson(Map<String, dynamic> json) =>
    PokemonStatsList(
      baseStat: json['base_stat'] as int?,
      effort: json['effort'] as int?,
      stat: PokemonStat.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonStatsListToJson(PokemonStatsList instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

PokemonStat _$PokemonStatFromJson(Map<String, dynamic> json) => PokemonStat(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PokemonStatToJson(PokemonStat instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
