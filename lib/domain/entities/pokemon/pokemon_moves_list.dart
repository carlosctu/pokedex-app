import 'package:json_annotation/json_annotation.dart';

part 'pokemon_moves_list.g.dart';

@JsonSerializable()
class PokemonMovesList {
  final PokemonMoves move;
  PokemonMovesList({
    required this.move,
  });
  factory PokemonMovesList.fromJson(Map<String, dynamic> json) =>
      _$PokemonMovesListFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonMovesListToJson(this);
}

@JsonSerializable()
class PokemonMoves {
  final String name;
  final String url;
  PokemonMoves({
    required this.name,
    required this.url,
  });

  factory PokemonMoves.fromJson(Map<String, dynamic> json) =>
      _$PokemonMovesFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonMovesToJson(this);
}
