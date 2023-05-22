import 'package:json_annotation/json_annotation.dart';

part 'pokedex_list_response.g.dart';

@JsonSerializable()
class PokedexListResponse {
  final int count;
  final String next;
  final List<PokedexDetailsResponse> results;
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
class PokedexDetailsResponse {
  final String? name;
  final String? url;
  PokedexDetailsResponse({
    this.name,
    this.url,
  });

  factory PokedexDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PokedexDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokedexDetailsResponseToJson(this);
}
