import 'package:flutter/material.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokedex/pokedex_response.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/pokedex_repository.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/widgets/pokemon_container_grid.dart';

class PokedexContainerGrid extends StatefulWidget {
  const PokedexContainerGrid({super.key});

  @override
  State<PokedexContainerGrid> createState() => _PokedexContainerGridState();
}

class _PokedexContainerGridState extends State<PokedexContainerGrid> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<PokedexResponse> getData() async {
    return PokedexRepository().getPokedexList();
  }

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
