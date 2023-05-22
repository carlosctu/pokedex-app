import 'package:pokedex_flutter_app/domain/entities/pokemon/pokemon_details_response.dart';

class DetailsPageArguments {
  final List<PokemonDetailsResponse> data;
  final int pokemonId;
  DetailsPageArguments({
    required this.data,
    required this.pokemonId,
  });
}
