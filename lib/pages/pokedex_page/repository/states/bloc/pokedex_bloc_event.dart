abstract class PokedexEvent {
  const PokedexEvent();
}

class PokedexEventFetchPokemonList extends PokedexEvent {}

class PokedexEventFetchPokemonDetails extends PokedexEvent {}
