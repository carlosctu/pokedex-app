import 'dart:ui';
import 'package:flutter/material.dart';
import 'context_group.dart';

class PokeColors {
  final IdentityGroup identityGroup;
  final PokedexGreyScaleGroup greyScaleGroup;
  final PokemonContextGroup pokemonContextGroup;

  const PokeColors._({
    required this.identityGroup,
    required this.greyScaleGroup,
    required this.pokemonContextGroup,
  });

  static PokeColors contexts = const PokeColors._(
    identityGroup: IdentityGroup(
      primary: Color(0xFFDC0A2D),
    ),
    greyScaleGroup: PokedexGreyScaleGroup(
      dark: Color(0xFF212121),
      medium: Color(0xFF666666),
      light: Color(0xFFE0E0E0),
      background: Color(0xFFEFEFEF),
      white: Color(0xFFFFFFFF),
    ),
    pokemonContextGroup: PokemonContextGroup(
      bug: Color(0xFFA7B723),
      dark: Color(0xFF75574C),
      dragon: Color(0xFF7037FF),
      electric: Color(0xFFF9CF30),
      fairy: Color(0xFFE69EAC),
      fighting: Color(0xFFC12239),
      fire: Color(0xFFF57D31),
      flying: Color(0xFFA891EC),
      ghost: Color(0xFF70559B),
      normal: Color(0xFFAAA67F),
      grass: Color(0xFF74CB48),
      ground: Color(0xFFDEC16B),
      ice: Color(0xFF9AD6DF),
      poison: Color(0xFFA43E9E),
      physic: Color(0xFFFB5584),
      rock: Color(0xFFB69E31),
      steel: Color(0xFFB7B9D0),
      water: Color(0xFF6493EB),
    ),
  );
}
