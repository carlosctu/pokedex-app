import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_flutter_app/domain/entities/pokemon/pokemon_details_response.dart';

part 'pokedex_response.g.dart';

@JsonSerializable()
class PokedexResponse {
  final List<PokemonDetailsResponse> pokemonDetails;
  PokedexResponse({
    required this.pokemonDetails,
  });

  factory PokedexResponse.fromJson(Map<String, dynamic> json) =>
      _$PokedexResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokedexResponseToJson(this);
}
