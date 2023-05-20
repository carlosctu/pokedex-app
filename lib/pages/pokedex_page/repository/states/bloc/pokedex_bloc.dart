import 'package:pokedex_flutter_app/pages/pokedex_page/repository/pokedex_repository.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/states/bloc/pokedex_bloc_event.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/states/bloc/pokedex_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final PokedexRepository _repository;

  String offset = '0';
  String limit = "15";

  PokedexBloc(this._repository) : super(PokedexLoadingState()) {
    on<PokedexEventFetchPokemonList>((event, emit) async {
      await _fetchPokemonList(event, emit);
    });
  }

  Future _fetchPokemonList(
      PokedexEventFetchPokemonList event, Emitter<PokedexState> emit) async {
    try {
      emit(PokedexLoadingState());

      final result = await _repository.getPokedexList(
        limit: limit,
        offset: offset,
      );

      emit(PokedexInitialState(data: result));
    } catch (ex) {
      emit(PokedexErrorState(exception: ex));
    }
  }
}
