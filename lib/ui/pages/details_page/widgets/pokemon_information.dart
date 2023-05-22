import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';
import 'package:pokedex_flutter_app/domain/entities/pokemon/pokemon_details_response.dart';
import 'package:pokedex_flutter_app/domain/entities/pokemon/pokemon_types_list.dart';
import 'package:pokedex_flutter_app/ui/pages/details_page/widgets/pokemon_about_section.dart';
import 'package:pokedex_flutter_app/ui/pages/details_page/widgets/pokemon_stats_section.dart';
import 'package:pokedex_flutter_app/utils/extensions/extensions.dart';

class PokemonInformation extends StatelessWidget {
  final PokemonDetailsResponse pokemonDetails;
  final Color pokemonColor;
  const PokemonInformation({
    super.key,
    required this.pokemonDetails,
    required this.pokemonColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();
    final topPadding = MediaQuery.of(context).size.height / 3.5;

    return Container(
      margin: EdgeInsets.fromLTRB(4, topPadding, 4, 4),
      padding: const EdgeInsets.only(top: 80),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _PokemonTypesSection(
            types: pokemonDetails.types,
            pokemonColor: pokemonColor,
          ),
          const SizedBox(height: 16),
          PokemonAboutSection(
            theme: theme,
            pokemonDetails: pokemonDetails,
          ),
          const SizedBox(height: 16),
          PokemonStatsSection(
            theme: theme,
            pokemonDetails: pokemonDetails,
            pokemonColor: pokemonColor,
          )
        ],
      ),
    );
  }
}

class _PokemonTypesSection extends StatelessWidget {
  final List<PokemonTypesList> types;
  final Color pokemonColor;
  const _PokemonTypesSection({
    required this.types,
    required this.pokemonColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: types
          .map(
            (type) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: pokemonColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                type.type?.name?.capitalizeFirstLetter() ?? '',
                style: theme.typography.s2.copyWith(
                  color: theme.colors.greyScaleGroup.white,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
