import 'dart:math';
import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';
import 'package:pokedex_flutter_app/domain/entities/pokemon/pokemon_details_response.dart';
import 'package:pokedex_flutter_app/domain/entities/pokemon/pokemon_types_list.dart';
import 'package:pokedex_flutter_app/utils/extensions/extensions.dart';

class PokemonInformation extends StatelessWidget {
  final PokemonDetailsResponse pokemonDetails;
  const PokemonInformation({
    super.key,
    required this.pokemonDetails,
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
          ),
          const SizedBox(height: 18),
          _PokemonAboutSection(
            theme: theme,
            pokemonDetails: pokemonDetails,
          ),
        ],
      ),
    );
  }
}

class _PokemonTypesSection extends StatelessWidget {
  final List<PokemonTypesList> types;
  const _PokemonTypesSection({
    required this.types,
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
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
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

class _PokemonAboutSection extends StatelessWidget {
  final PokeThemeData theme;
  final PokemonDetailsResponse pokemonDetails;
  const _PokemonAboutSection({
    required this.pokemonDetails,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'About',
          style: theme.typography.s1,
        ),
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(
            top: 8,
          ),
          height: 64,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSection(
                hasToppadding: true,
                caption: 'Weight',
                topContent: [
                  const Icon(
                    Icons.work_outline,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${(pokemonDetails.weight / 10).toString()} kg',
                    style: theme.typography.b1,
                  )
                ],
              ),
              _buildDivider(),
              _buildSection(
                hasToppadding: true,
                caption: 'Height',
                topContent: [
                  Transform.rotate(
                    angle: 90 * (pi / 180),
                    child: const Icon(
                      Icons.straighten_rounded,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${(pokemonDetails.height / 10).toString()} m',
                    style: theme.typography.b1,
                  )
                ],
              ),
              _buildDivider(),
              _buildSection(
                caption: 'Moves',
                topContent: [
                  Column(
                    children: pokemonDetails.moves
                        .sublist(0, 2)
                        .map(
                          (move) => Text(
                            move.move.name.capitalizeFirstLetter(),
                            style: theme.typography.b2.copyWith(
                              color: theme.colors.greyScaleGroup.dark,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSection({
    required List<Widget> topContent,
    required String caption,
    bool? hasToppadding,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (hasToppadding != null) const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: topContent,
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              caption,
              style: theme.typography.b3.copyWith(
                color: theme.colors.greyScaleGroup.medium,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 52,
      color: theme.colors.greyScaleGroup.light,
    );
  }
}
