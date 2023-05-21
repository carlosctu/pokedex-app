import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_system/poke_system.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/states/bloc/pokedex_bloc.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/states/bloc/pokedex_bloc_event.dart';

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

class _AppSearchBar extends StatefulWidget {
  const _AppSearchBar();

  @override
  State<_AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<_AppSearchBar> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    final pokedexBloc = context.read<PokedexBloc>();

    void onPokemonSearched(String value) {
      setState(() {
        pokedexBloc.add(
          PokedexEventSearchPokemon(
            query: value,
          ),
        );
      });
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchBar(
            onSearch: (value) => onPokemonSearched(query),
            onSearchChanged: (value) {
              if (value == null || value.isEmpty) {
                onPokemonSearched('');
              }
              setState(() => query = value ?? '');
            },
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
