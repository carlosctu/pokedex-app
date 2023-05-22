import 'package:pokedex_flutter_app/domain/entities/pokemon/pokemon_details_response.dart';

abstract class PokedexState {}

class PokedexInitialState extends PokedexState {
  final List<PokemonDetailsResponse> data;
  PokedexInitialState({required this.data});
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
