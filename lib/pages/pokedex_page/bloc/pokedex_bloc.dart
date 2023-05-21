import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_details_response.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/pokedex_repository.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/bloc/pokedex_bloc_event.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/bloc/pokedex_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final PokedexRepository _repository;

  int offset = 0;
  int limit = 15;
  bool isLoading = false;
  List<PokemonDetailsResponse> list = [];

  PokedexBloc(this._repository) : super(PokedexLoadingState([])) {
    on<PokedexEventFetchPokemonList>((event, emit) async {
      await _fetchPokemonList(event, emit);
    });

    on<PokedexEventSearchPokemon>((event, emit) {
      _onPokemonSearched(event, emit);
    });
  }

  Future<void> _fetchPokemonList(
    PokedexEventFetchPokemonList event,
    Emitter<PokedexState> emit,
  ) async {
    emit(PokedexLoadingState(list));

    try {
      if (!isLoading) {
        isLoading = true;
        final result = await _repository.getPokedexList(
          limit: limit.toString(),
          offset: offset.toString(),
        );
        list.addAll(result.pokemonDetails);
        offset = limit;
        limit += 15;
        emit(PokedexInitialState(data: list));
      }
    } catch (ex) {
      emit(PokedexErrorState(exception: ex));
    } finally {
      isLoading = false;
    }
  }

  void _onPokemonSearched(
    PokedexEventSearchPokemon event,
    Emitter<PokedexState> emit,
  ) {
    final query = event.query;

    if (query.isNotEmpty) {
      final filteredList = _getSearchedPokemon(event, query);
      return emit(PokedexInitialState(data: filteredList));
    }
    return emit(PokedexInitialState(data: list));
  }

  List<PokemonDetailsResponse> _getSearchedPokemon(
      PokedexEventSearchPokemon event, String query) {
    return list.where(
      (pokemon) {
        switch (event.filterType) {
          case PokedexFilterType.tag:
            return pokemon.formattedId == query;
          case PokedexFilterType.name:
            return pokemon.name.toLowerCase().startsWith(query.toLowerCase());
        }
      },
    ).toList();
  }
}
