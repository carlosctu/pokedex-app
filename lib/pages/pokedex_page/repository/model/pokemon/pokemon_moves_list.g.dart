// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_moves_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonMovesList _$PokemonMovesListFromJson(Map<String, dynamic> json) =>
    PokemonMovesList(
      move: PokemonMoves.fromJson(json['move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonMovesListToJson(PokemonMovesList instance) =>
    <String, dynamic>{
      'move': instance.move,
    };

PokemonMoves _$PokemonMovesFromJson(Map<String, dynamic> json) => PokemonMoves(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonMovesToJson(PokemonMoves instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
