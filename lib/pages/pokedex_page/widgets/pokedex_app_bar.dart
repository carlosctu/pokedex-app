import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_system/poke_system.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/bloc/pokedex_bloc.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/bloc/pokedex_bloc_event.dart';

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
  PokedexFilterType filterType = PokedexFilterType.tag;

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();
    final pokedexBloc = context.read<PokedexBloc>();

    void onPokemonSearched(String value) {
      setState(() {
        pokedexBloc.add(
          PokedexEventSearchPokemon(
            query: value,
            filterType: filterType,
          ),
        );
      });
    }

    IconData getFilterIcon(PokedexFilterType filterType) {
      switch (filterType) {
        case PokedexFilterType.tag:
          return Icons.tag;
        case PokedexFilterType.name:
          return Icons.text_format;
      }
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
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return FilterDialogBox(filterType: filterType);
                },
              ).then((value) => setState(() {
                    if (value != null) {
                      filterType = value;
                    }
                  }));
            },
            child: Container(
              alignment: Alignment.center,
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: theme.colors.greyScaleGroup.white,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                getFilterIcon(filterType),
                size: 18,
                color: theme.colors.identityGroup.primary,
              ),
            ),
          ),
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

class FilterDialogBox extends StatelessWidget {
  final PokedexFilterType filterType;
  const FilterDialogBox({
    super.key,
    required this.filterType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();
    return StatefulBuilder(
      builder: (context, setState) {
        PokedexFilterType filterType2 = filterType;
        return AlertDialog(
          alignment: Alignment.center,
          insetPadding: const EdgeInsets.symmetric(horizontal: 100),
          backgroundColor: Colors.transparent,
          content: Container(
            height: 150,
            decoration: BoxDecoration(
              color: theme.colors.identityGroup.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 42, 16),
                  child: Text(
                    'Sort by:',
                    style: theme.typography.s1.bold.copyWith(
                      color: theme.colors.greyScaleGroup.white,
                    ),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (_, BoxConstraints constraints) {
                      return Container(
                        width: constraints.maxWidth,
                        margin: const EdgeInsets.fromLTRB(4, 0, 4, 4),
                        decoration: BoxDecoration(
                          color: theme.colors.greyScaleGroup.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RadioListTile(
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'Number',
                                style: theme.typography.b2,
                              ),
                              activeColor: theme.colors.identityGroup.primary,
                              value: PokedexFilterType.tag,
                              onChanged: (value) {
                                setState(() {
                                  filterType2 = value!;
                                  Navigator.pop(context, filterType2);
                                });
                              },
                              groupValue: filterType2,
                            ),
                            const SizedBox(height: 4),
                            RadioListTile(
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'Name',
                                style: theme.typography.b2,
                              ),
                              activeColor: theme.colors.identityGroup.primary,
                              value: PokedexFilterType.name,
                              onChanged: (value) {
                                setState(() {
                                  filterType2 = value!;
                                  Navigator.pop(context, filterType2);
                                });
                              },
                              groupValue: filterType2,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
