// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_ability_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonAbilityList _$PokemonAbilityListFromJson(Map<String, dynamic> json) =>
    PokemonAbilityList(
      isHidden: json['isHidden'] as bool,
      slot: json['slot'] as int,
      ability: (json['is_hidden'] as List<dynamic>)
          .map((e) => PokemonAbility.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonAbilityListToJson(PokemonAbilityList instance) =>
    <String, dynamic>{
      'is_hidden': instance.ability,
      'isHidden': instance.isHidden,
      'slot': instance.slot,
    };

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) =>
    PokemonAbility(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonAbilityToJson(PokemonAbility instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
