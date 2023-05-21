abstract class PokedexEvent {
  const PokedexEvent();
}

class PokedexEventFetchPokemonList extends PokedexEvent {}

class PokedexEventSearchPokemon extends PokedexEvent {
  final String query;
  PokedexEventSearchPokemon({
    required this.query,
  });
}

class PokedexEventFetchPokemonDetails extends PokedexEvent {}
