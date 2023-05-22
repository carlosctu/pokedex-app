enum PokemonTypeColor {
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  monster,
  normal,
  poison,
  psychic,
  rock,
  steel,
  unknown,
  water,
}

class PokemonTypeColors {
  static PokemonTypeColor getTypeColor(String? name) {
    switch (name) {
      case 'bug':
        return PokemonTypeColor.bug;
      case 'dark':
        return PokemonTypeColor.dark;
      case 'dragon':
        return PokemonTypeColor.dragon;
      case 'electric':
        return PokemonTypeColor.electric;
      case 'fairy':
        return PokemonTypeColor.fairy;
      case 'fighting':
        return PokemonTypeColor.fighting;
      case 'fire':
        return PokemonTypeColor.fire;
      case 'flying':
        return PokemonTypeColor.flying;
      case 'ghost':
        return PokemonTypeColor.ghost;
      case 'grass':
        return PokemonTypeColor.grass;
      case 'ground':
        return PokemonTypeColor.ground;
      case 'ice':
        return PokemonTypeColor.ice;
      case 'monster':
        return PokemonTypeColor.monster;
      case 'normal':
        return PokemonTypeColor.normal;
      case 'poison':
        return PokemonTypeColor.poison;
      case 'psychic':
        return PokemonTypeColor.psychic;
      case 'rock':
        return PokemonTypeColor.rock;
      case 'steel':
        return PokemonTypeColor.steel;
      case 'unknown':
        return PokemonTypeColor.unknown;
      case 'water':
        return PokemonTypeColor.water;
      default:
        return PokemonTypeColor.unknown;
    }
  }
}
