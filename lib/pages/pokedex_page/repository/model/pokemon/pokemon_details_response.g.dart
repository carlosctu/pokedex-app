// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailsResponse _$PokemonDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailsResponse(
      id: json['id'] as int,
      order: json['order'] as String,
      name: json['name'] as String,
      weight: json['weight'] as int,
      location: json['location'] as String,
      height: json['height'] as String,
      isDefault: json['is_default'] as bool,
      experience: json['base_experience'] as int,
      abilities: PokemonAbilityList.fromJson(
          json['location_area_encounters'] as Map<String, dynamic>),
      forms: PokemonForm.fromJson(json['forms'] as Map<String, dynamic>),
      moves: PokemonMovesList.fromJson(json['moves'] as Map<String, dynamic>),
      species: PokemonSpecies.fromJson(json['species'] as Map<String, dynamic>),
      sprites: PokemonSprites.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: PokemonStatsList.fromJson(json['stats'] as Map<String, dynamic>),
      types: PokemonTypesList.fromJson(json['types'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonDetailsResponseToJson(
        PokemonDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'name': instance.name,
      'weight': instance.weight,
      'location': instance.location,
      'height': instance.height,
      'is_default': instance.isDefault,
      'base_experience': instance.experience,
      'location_area_encounters': instance.abilities,
      'forms': instance.forms,
      'moves': instance.moves,
      'species': instance.species,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'types': instance.types,
    };

PokemonForm _$PokemonFormFromJson(Map<String, dynamic> json) => PokemonForm(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonFormToJson(PokemonForm instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokemonSpecies _$PokemonSpeciesFromJson(Map<String, dynamic> json) =>
    PokemonSpecies(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonSpeciesToJson(PokemonSpecies instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokemonSprites _$PokemonSpritesFromJson(Map<String, dynamic> json) =>
    PokemonSprites(
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'] as String?,
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'] as String?,
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
    );

Map<String, dynamic> _$PokemonSpritesToJson(PokemonSprites instance) =>
    <String, dynamic>{
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };
