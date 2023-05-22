import 'package:pokedex_flutter_app/domain/entities/pokemon/pokemon_details_response.dart';

abstract class PokedexState {}

class PokedexDataState extends PokedexState {
  final List<PokemonDetailsResponse> pokemonList;
  final List<PokemonDetailsResponse>? filteredList;
  PokedexDataState({
    required this.pokemonList,
    this.filteredList,
  });
}

class PokedexLoadingState extends PokedexState {
  final List<PokemonDetailsResponse> data;
  PokedexLoadingState(this.data);
}

class PokedexErrorState extends PokedexState {
  final Object? exception;
  final List<PokemonDetailsResponse> data;
  PokedexErrorState({
    this.exception,
    required this.data,
  });
}
