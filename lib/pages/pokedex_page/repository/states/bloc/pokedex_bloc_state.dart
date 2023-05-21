import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_details_response.dart';

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
  PokedexErrorState({required this.exception});
}
