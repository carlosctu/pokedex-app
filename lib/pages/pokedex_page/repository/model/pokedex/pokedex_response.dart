import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokedex/pokedex_list_response.dart';

part 'pokedex_response.g.dart';

@JsonSerializable()
class PokedexResponse {
  final int count;
  final String next;
  final List<PokemonDetailsResponse> pokemonDetails;
  PokedexResponse({
    required this.count,
    required this.next,
    required this.pokemonDetails,
  });
}
