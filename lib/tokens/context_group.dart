import 'dart:ui';

class PokemonContextGroup {
  final Color bug;
  final Color dark;
  final Color dragon;
  final Color electric;
  final Color fairy;
  final Color fighting;
  final Color fire;
  final Color flying;
  final Color ghost;
  final Color normal;
  final Color grass;
  final Color ground;
  final Color ice;
  final Color poison;
  final Color physic;
  final Color rock;
  final Color steel;
  final Color water;
  const PokemonContextGroup({
    required this.bug,
    required this.dark,
    required this.dragon,
    required this.electric,
    required this.fairy,
    required this.fighting,
    required this.fire,
    required this.flying,
    required this.ghost,
    required this.normal,
    required this.grass,
    required this.ground,
    required this.ice,
    required this.poison,
    required this.physic,
    required this.rock,
    required this.steel,
    required this.water,
  });
}

class PokedexGreyScaleGroup {
  final Color dark;
  final Color medium;
  final Color light;
  final Color background;
  final Color white;
  const PokedexGreyScaleGroup({
    required this.dark,
    required this.medium,
    required this.light,
    required this.background,
    required this.white,
  });
}

class IdentityGroup {
  final Color primary;
  const IdentityGroup({
    required this.primary,
  });
}
