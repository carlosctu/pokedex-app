import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_app/data/repository/pokedex_repository.dart';
import 'package:pokedex_flutter_app/domain/bloc/pokedex_bloc_event.dart';
import 'package:pokedex_flutter_app/domain/bloc/pokedex_bloc_state.dart';
import 'package:pokedex_flutter_app/domain/entities/pokemon/pokemon_details_response.dart';

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
        print(offset);
        final result = await _repository.getPokedexList(
          limit: limit,
          offset: offset,
        );
        isLoading = true;
        list.addAll(result.pokemonDetails);
        offset = limit;
        limit += 15;
        emit(PokedexDataState(pokemonList: list));
      }
    } catch (ex) {
      emit(PokedexErrorState(exception: ex, data: list));
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
      return emit(PokedexDataState(
        pokemonList: list,
        filteredList: filteredList,
      ));
    }
    return emit(PokedexDataState(pokemonList: list));
  }

  List<PokemonDetailsResponse> _getSearchedPokemon(
      PokedexEventSearchPokemon event, String query) {
    return list.where(
      (pokemon) {
        switch (event.filterType) {
          case PokedexFilterType.tag:
            return pokemon.formattedId.startsWith(query);
          case PokedexFilterType.name:
            return pokemon.name.toLowerCase().startsWith(query.toLowerCase());
        }
      },
    ).toList();
  }
}
