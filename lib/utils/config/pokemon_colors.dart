import 'package:flutter/material.dart';
import 'package:pokedex_flutter_app/utils/config/pokemon_type_colors.dart';

class PokemonColors {
  static const Color beige = Color(0xFFA8A878);
  static const Color black = Color(0xFF303943);
  static const Color blue = Color(0xFF429BED);
  static const Color brown = Color(0xFFB1736C);
  static const Color darkBrown = Color(0xD0795548);
  static const Color darkGrey = Color(0xFF303943);
  static const Color grey = Color(0x64303943);
  static const Color indigo = Color(0xFF6C79DB);
  static const Color lightBlue = Color(0xFF7AC7FF);
  static const Color lightBrown = Color(0xFFCA8179);
  static const Color whiteGrey = Color(0xFFFDFDFD);
  static const Color lightCyan = Color(0xFF98D8D8);
  static const Color lightGreen = Color(0xFF78C850);
  static const Color lighterGrey = Color(0xFFF4F5F4);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color lightPink = Color(0xFFEE99AC);
  static const Color lightPurple = Color(0xFF9F5BBA);
  static const Color lightRed = Color(0xFFFB6C6C);
  static const Color lightTeal = Color(0xFF48D0B0);
  static const Color lightYellow = Color(0xFFFFCE4B);
  static const Color lilac = Color(0xFFA890F0);
  static const Color pink = Color(0xFFF85888);
  static const Color purple = Color(0xFF7C538C);
  static const Color red = Color(0xFFFA6555);
  static const Color teal = Color(0xFF4FC1A6);
  static const Color yellow = Color(0xFFF6C747);
  static const Color semiGrey = Color(0xFFbababa);
  static const Color violet = Color(0xD07038F8);

  static Color getPokemonColorByType(String? type) {
    PokemonTypeColor colorType = PokemonTypeColors.getTypeColor(type);
    switch (colorType) {
      case PokemonTypeColor.grass:
      case PokemonTypeColor.bug:
        return lightTeal;

      case PokemonTypeColor.fire:
        return lightRed;

      case PokemonTypeColor.water:
        return lightBlue;

      case PokemonTypeColor.normal:
      case PokemonTypeColor.flying:
        return semiGrey;

      case PokemonTypeColor.fighting:
        return brown;

      case PokemonTypeColor.electric:
      case PokemonTypeColor.psychic:
        return lightYellow;

      case PokemonTypeColor.poison:
      case PokemonTypeColor.ghost:
        return lightPurple;

      case PokemonTypeColor.ground:
      case PokemonTypeColor.rock:
        return lightBrown;

      case PokemonTypeColor.dark:
        return black;

      case PokemonTypeColor.fairy:
        return lightPink;

      default:
        return lightBlue;
    }
  }
}
