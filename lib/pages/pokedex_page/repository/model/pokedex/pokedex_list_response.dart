import 'package:json_annotation/json_annotation.dart';

part 'pokedex_list_response.g.dart';

@JsonSerializable()
class PokedexListResponse {
  final int count;
  final String next;
  final List<PokemonDetailsResponse> results;
  PokedexListResponse({
    required this.count,
    required this.next,
    required this.results,
  });

  factory PokedexListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokedexListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokedexListResponseToJson(this);
}

@JsonSerializable()
class PokemonDetailsResponse {
  final String name;
  final String url;
  PokemonDetailsResponse({
    required this.name,
    required this.url,
  });

  factory PokemonDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonDetailsResponseToJson(this);
}
