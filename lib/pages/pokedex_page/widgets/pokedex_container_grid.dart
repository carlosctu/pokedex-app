import 'package:flutter/material.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokedex/pokedex_response.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/widgets/pokemon_container_grid.dart';
import 'package:pokedex_flutter_app/shared/utils/string_extensions.dart';

class PokedexContainerGrid extends StatelessWidget {
  final PokedexResponse data;
  const PokedexContainerGrid({
    super.key,
    required this.data,
  });

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
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 3,
        ),
        itemCount: data.pokemonDetails.length,
        itemBuilder: (BuildContext context, int index) {
          final pokemon = data.pokemonDetails[index];
          return PokemonContainerGrid(
            pokemonName: pokemon.name.capitalizeFirstLetter(),
            pokemonNumber: pokemon.id.formatPokemonNumber(),
            pokemonImage: pokemon.sprites.originalImage!,
          );
        },
      ),
    );
  }
}
