// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailsResponse _$PokemonDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailsResponse(
      id: json['id'] as int,
      order: json['order'] as int,
      name: json['name'] as String,
      weight: json['weight'] as int,
      location: json['location'] as String?,
      height: json['height'] as int,
      isDefault: json['is_default'] as bool,
      experience: json['base_experience'] as int,
      forms: (json['forms'] as List<dynamic>)
          .map((e) => PokemonForm.fromJson(e as Map<String, dynamic>))
          .toList(),
      moves: (json['moves'] as List<dynamic>)
          .map((e) => PokemonMovesList.fromJson(e as Map<String, dynamic>))
          .toList(),
      species: PokemonSpecies.fromJson(json['species'] as Map<String, dynamic>),
      sprites: PokemonSprites.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokemonStatsList.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonTypesList.fromJson(e as Map<String, dynamic>))
          .toList(),
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
