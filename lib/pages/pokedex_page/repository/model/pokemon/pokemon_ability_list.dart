import 'package:json_annotation/json_annotation.dart';

part 'pokemon_ability_list.g.dart';

@JsonSerializable()
class PokemonAbilityList {
  @JsonKey(name: 'is_hidden')
  final List<PokemonAbility> ability;
  final bool isHidden;
  final int slot;
  PokemonAbilityList({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  factory PokemonAbilityList.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityListFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonAbilityListToJson(this);
}

@JsonSerializable()
class PokemonAbility {
  final String name;
  final String url;
  PokemonAbility({
    required this.name,
    required this.url,
  });

  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);
}
