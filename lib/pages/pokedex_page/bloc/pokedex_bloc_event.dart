abstract class PokedexEvent {
  const PokedexEvent();
}

enum PokedexFilterType { tag, name }

class PokedexEventFetchPokemonList extends PokedexEvent {}

class PokedexEventSearchPokemon extends PokedexEvent {
  final String query;
  final PokedexFilterType filterType;
  PokedexEventSearchPokemon({
    required this.query,
    required this.filterType,
  });
}

class PokedexEventFetchPokemonDetails extends PokedexEvent {}
