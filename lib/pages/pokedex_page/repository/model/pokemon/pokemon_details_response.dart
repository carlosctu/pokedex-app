import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_ability_list.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_moves_list.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_stats_list.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_types_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_details_response.g.dart';

@JsonSerializable()
class PokemonDetailsResponse {
  final int id;
  final String order;
  final String name;
  final int weight;
  final String location;
  final String height;
  @JsonKey(name: "is_default")
  final bool isDefault;
  @JsonKey(name: "base_experience")
  final int experience;
  @JsonKey(name: "location_area_encounters")
  final PokemonAbilityList abilities;
  final PokemonForm forms;
  final PokemonMovesList moves;
  final PokemonSpecies species;
  final PokemonSprites sprites;
  final PokemonStatsList stats;
  final PokemonTypesList types;
  PokemonDetailsResponse({
    required this.id,
    required this.order,
    required this.name,
    required this.weight,
    required this.location,
    required this.height,
    required this.isDefault,
    required this.experience,
    required this.abilities,
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

@JsonSerializable()
class PokemonSprites {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_female')
  final String? backFemale;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;
  PokemonSprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });
  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSpritesToJson(this);
}
