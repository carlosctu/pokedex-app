import 'package:flutter/material.dart';
import 'package:pokedex_flutter_app/ui/pages/details_page/arguments/details_page_arguments.dart';
import 'package:pokedex_flutter_app/ui/pages/details_page/pokemon_details_page.dart';
import 'package:pokedex_flutter_app/ui/pages/pokedex_page/pokedex_page.dart';

enum Routes {
  pokedex,
  details,
}

class PathRoutes {
  static const String pokedex = '/';
  static const String details = '/details';

  static const Map<Routes, String> _pathMap = {
    Routes.pokedex: PathRoutes.pokedex,
    Routes.details: PathRoutes.details,
  };

  static String currentRoute({required String route}) =>
      _pathMap[route] ?? pokedex;
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PathRoutes.pokedex:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const PokedexPage(),
      );
    case PathRoutes.details:
      final arguments = settings.arguments as DetailsPageArguments;
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => PokemonDetailsPage(args: arguments),
      );
  }
  return null;
}
