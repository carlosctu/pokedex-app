import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';

class PokedexAppBar extends StatelessWidget {
  const PokedexAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _AppBarTitle(),
        _AppSearchBar(),
      ],
    );
  }
}

class _AppSearchBar extends StatelessWidget {
  const _AppSearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchBar(
            onSearchChanged: (value) {},
            onSearch: (value) {},
            hintText: "Search",
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();

    return Container(
      alignment: AlignmentDirectional.center,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/png/pokeball.png',
            height: 24,
          ),
          const SizedBox(width: 16),
          Text(
            'Pokédex',
            style: theme.typography.h1.copyWith(
              color: theme.colors.greyScaleGroup.white,
            ),
          ),
        ],
      ),
    );
  }
}
