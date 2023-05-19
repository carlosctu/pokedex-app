import 'package:json_annotation/json_annotation.dart';

part 'pokedex_list_response.g.dart';

@JsonSerializable()
class PokedexListResponse {
  final int count;
  final String next;
  final List<PokemonResponse> result;
  PokedexListResponse({
    required this.count,
    required this.next,
    required this.result,
  });

  factory PokedexListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokedexListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokedexListResponseToJson(this);
}

@JsonSerializable()
class PokemonResponse {
  final String name;
  final String url;
  PokemonResponse({
    required this.name,
    required this.url,
  });

  factory PokedexListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokedexListResponse(json);
  Map<String, dynamic> toJson() => _$PokedexListResponse(this);
}
