import 'package:json_annotation/json_annotation.dart';

part 'pokemon_types_list.g.dart';

@JsonSerializable()
class PokemonTypesList {
  final int? slot;
  final PokemonType? type;
  PokemonTypesList({
    this.slot,
    this.type,
  });

  factory PokemonTypesList.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypesListFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypesListToJson(this);
}

@JsonSerializable()
class PokemonType {
  final String? name;
  final String? url;
  PokemonType({
    this.name,
    this.url,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}
