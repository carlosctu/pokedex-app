import 'package:flutter/material.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/widgets/pokemon_container_grid.dart';

class PokedexContainerGrid extends StatelessWidget {
  const PokedexContainerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 4),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: GridView.count(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 3,
          children: List.generate(
            20,
            (index) => PokemonContainerGrid(
              pokemonName: "Bulbasaur",
              pokemonNumber: "#$index",
              pokemonImage: "assets/png/pokemon.png",
            ),
          ).toList()),
    );
  }
}
