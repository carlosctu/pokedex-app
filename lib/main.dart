import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';

import 'pages/pokedex_page/pokedex_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Flutter App',
      debugShowCheckedModeBanner: false,
      theme: PokeThemeData().themeData,
      home: const PokedexPage(),
    );
  }
}
