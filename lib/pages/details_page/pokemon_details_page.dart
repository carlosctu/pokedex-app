import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';

import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_details_response.dart';
import 'package:pokedex_flutter_app/shared/utils/extensions.dart';

class PokemonDetailsPage extends StatelessWidget {
  final List<PokemonDetailsResponse> data;
  final PokemonDetailsResponse pokemonData;
  const PokemonDetailsPage({
    Key? key,
    required this.data,
    required this.pokemonData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();
    final topPadding = MediaQuery.of(context).size.height / 4;

    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(4, topPadding, 4, 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: AlignmentDirectional.topEnd,
              child: Image.asset(
                'assets/png/pokeball_background.png',
                height: 208,
                width: 206,
                color: theme.colors.greyScaleGroup.white.withOpacity(0.2),
              ),
            ),
            PokemonAppBar(
              theme: theme,
              pokemonData: pokemonData,
            ),
            Container(
              padding: const EdgeInsets.only(top: 80),
              alignment: Alignment.topCenter,
              child: Hero(
                tag: pokemonData.id,
                child: Image.network(
                  pokemonData.sprites.originalImage!,
                  height: 240,
                  width: 240,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PokemonAppBar extends StatelessWidget {
  const PokemonAppBar({
    super.key,
    required this.theme,
    required this.pokemonData,
  });

  final PokeThemeData theme;
  final PokemonDetailsResponse pokemonData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
      alignment: AlignmentDirectional.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 14,
                ),
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  size: 28,
                  color: theme.colors.greyScaleGroup.white,
                ),
              ),
              Text(
                pokemonData.name.capitalizeFirstLetter(),
                style: theme.typography.h1.copyWith(
                  color: theme.colors.greyScaleGroup.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(
              pokemonData.id.formatPokemonNumber(),
              style: theme.typography.s1.copyWith(
                color: theme.colors.greyScaleGroup.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
