import 'package:json_annotation/json_annotation.dart';

part 'pokemon_sprites.g.dart';

@JsonSerializable()
class PokemonSprites {
  final Map<String, dynamic> other;

  PokemonSprites({required this.other});

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSpritesToJson(this);

  String? get originalImage => other['official-artwork']?['front_default'];
}
