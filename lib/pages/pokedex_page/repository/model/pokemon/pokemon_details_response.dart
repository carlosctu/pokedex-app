import 'package:json_annotation/json_annotation.dart';

import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_moves_list.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_sprites.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_stats_list.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_types_list.dart';

part 'pokemon_details_response.g.dart';

@JsonSerializable()
class PokemonDetailsResponse {
  final int id;
  final int order;
  final String name;
  final int weight;
  final String? location;
  final int height;
  @JsonKey(name: "is_default")
  final bool isDefault;
  @JsonKey(name: "base_experience")
  final int experience;
  final List<PokemonForm> forms;
  final List<PokemonMovesList> moves;
  final PokemonSpecies species;
  final PokemonSprites sprites;
  final List<PokemonStatsList> stats;
  final List<PokemonTypesList> types;
  PokemonDetailsResponse({
    required this.id,
    required this.order,
    required this.name,
    required this.weight,
    this.location,
    required this.height,
    required this.isDefault,
    required this.experience,
    required this.forms,
    required this.moves,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
  });

  factory PokemonDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonDetailsResponseToJson(this);
}

@JsonSerializable()
class PokemonForm {
  final String name;
  final String url;
  PokemonForm({
    required this.name,
    required this.url,
  });

  factory PokemonForm.fromJson(Map<String, dynamic> json) =>
      _$PokemonFormFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonFormToJson(this);
}

@JsonSerializable()
class PokemonSpecies {
  final String name;
  final String url;
  PokemonSpecies({
    required this.name,
    required this.url,
  });

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSpeciesToJson(this);
}
