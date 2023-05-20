import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokedex/pokedex_response.dart';

abstract class PokedexState {}

class PokedexInitialState extends PokedexState {
  final PokedexResponse data;
  PokedexInitialState({required this.data});
}

class PokedexLoadingState extends PokedexState {}

class PokedexErrorState extends PokedexState {
  final Object? exception;
  PokedexErrorState({required this.exception});
}
