import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_system/poke_system.dart';
import 'package:pokedex_flutter_app/domain/bloc/pokedex_bloc.dart';
import 'package:pokedex_flutter_app/domain/bloc/pokedex_bloc_event.dart';

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
    final pokedexBloc = context.read<PokedexBloc>();

    void handleOnSearch(String? value) {
      if (value == null) return;
      setState(() {
        pokedexBloc.add(
          PokedexEventSearchPokemon(
            query: value,
            filterType: filterType,
          ),
        );
      });
    }

    void handleOnSearchChanged(String? value) {
      if (value == null || value.isEmpty) {
        handleOnSearch('');
      } else {
        setState(() {
          query = value;
          handleOnSearch(value);
        });
      }
    }

    openFilterDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return FilterDialogBox(filterType: filterType);
        },
      ).then((value) {
        if (value != null) filterType = value;
        setState(() {});
      });
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchBar(
            onSearch: handleOnSearch,
            onSearchChanged: handleOnSearchChanged,
            hintText: "Search",
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: openFilterDialog,
            child: _buildFilterButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton() {
    final theme = PokeThemeData();
    return Container(
      alignment: Alignment.center,
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          color: theme.colors.greyScaleGroup.white,
          borderRadius: BorderRadius.circular(50)),
      child: Icon(
        _getFilterIcon(filterType),
        size: 18,
        color: theme.colors.identityGroup.primary,
      ),
    );
  }

  IconData _getFilterIcon(PokedexFilterType filterType) {
    switch (filterType) {
      case PokedexFilterType.tag:
        return Icons.tag;
      case PokedexFilterType.name:
        return Icons.text_format;
    }
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
      builder: (_, setState) {
        PokedexFilterType currentFilter = filterType;

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
                _buildFilterTitle(),
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
                            _buildRadioButton(
                              filterName: 'Number',
                              value: PokedexFilterType.tag,
                              currentFilter: currentFilter,
                              onChanged: (value) {
                                setState(() {
                                  currentFilter = value! as PokedexFilterType;
                                  Navigator.pop(context, currentFilter);
                                });
                              },
                            ),
                            const SizedBox(height: 4),
                            _buildRadioButton(
                              filterName: 'Name',
                              value: PokedexFilterType.name,
                              currentFilter: currentFilter,
                              onChanged: (value) {
                                setState(() {
                                  currentFilter = value! as PokedexFilterType;
                                  Navigator.pop(context, currentFilter);
                                });
                              },
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

  Widget _buildFilterTitle() {
    final theme = PokeThemeData();
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 42, 16),
      child: Text(
        'Sort by:',
        style: theme.typography.s1.bold.copyWith(
          color: theme.colors.greyScaleGroup.white,
        ),
      ),
    );
  }

  Widget _buildRadioButton({
    required String filterName,
    required PokedexFilterType value,
    required PokedexFilterType currentFilter,
    required Function(Object? value) onChanged,
  }) {
    final theme = PokeThemeData();
    return RadioListTile(
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      contentPadding: EdgeInsets.zero,
      title: Text(
        filterName,
        style: theme.typography.b2,
      ),
      activeColor: theme.colors.identityGroup.primary,
      value: value,
      onChanged: (value) => onChanged(value),
      groupValue: currentFilter,
    );
  }
}
