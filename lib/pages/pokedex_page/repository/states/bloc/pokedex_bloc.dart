import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_details_response.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/pokedex_repository.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/states/bloc/pokedex_bloc_event.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/states/bloc/pokedex_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final PokedexRepository _repository;

  int offset = 0;
  int limit = 15;
  List<PokemonDetailsResponse> list = [];

  PokedexBloc(this._repository) : super(PokedexLoadingState([])) {
    on<PokedexEventFetchPokemonList>((event, emit) async {
      await _fetchPokemonList(event, emit);
    });

    on<PokedexEventSearchPokemon>((event, emit) async {
      final query = event.query;

      if (query.isNotEmpty) {
        final filteredList = list.where(
          (pokemon) {
            return pokemon.formattedId == query;
          },
        ).toList();

        return emit(PokedexInitialState(data: filteredList));
      }
      return emit(PokedexInitialState(data: list));
    });
  }

  Future _fetchPokemonList(
      PokedexEventFetchPokemonList event, Emitter<PokedexState> emit) async {
    emit(PokedexLoadingState(list));

    try {
      final result = await _repository.getPokedexList(
        limit: limit.toString(),
        offset: offset.toString(),
      );
      list.addAll(result.pokemonDetails);
      offset = limit;
      limit += 15;
      emit(PokedexInitialState(data: list));
    } catch (ex) {
      emit(PokedexErrorState(exception: ex));
    }
  }

  // Future _fetchPokemonList(
  //     PokedexEventFetchPokemonList event, Emitter<PokedexState> emit) async {
  //   try {
  //     emit(PokedexLoadingState());

  //     final result = await _repository.getPokedexList(
  //       limit: limit.toString(),
  //       offset: offset.toString(),
  //     );

  //     emit(PokedexInitialState(data: result.pokemonDetails));
  //   } catch (ex) {
  //     emit(PokedexErrorState(exception: ex));
  //   }
  // }
}
