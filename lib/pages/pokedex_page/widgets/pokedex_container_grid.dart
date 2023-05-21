import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/repository/model/pokemon/pokemon_details_response.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/bloc/pokedex_bloc.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/bloc/pokedex_bloc_event.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/widgets/pokemon_container_grid.dart';
import 'package:pokedex_flutter_app/shared/ui/skeletons/pokedex_loading_skeleton.dart';
import 'package:pokedex_flutter_app/shared/utils/extensions.dart';

class PokedexContainerGrid extends StatefulWidget {
  final List<PokemonDetailsResponse> data;
  final Widget statusWidget;
  final bool isLoading;
  const PokedexContainerGrid({
    Key? key,
    required this.data,
    required this.statusWidget,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<PokedexContainerGrid> createState() => _PokedexContainerGridState();
}

class _PokedexContainerGridState extends State<PokedexContainerGrid> {
  PokedexBloc get pokedexBloc => context.read<PokedexBloc>();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (!widget.isLoading) {
        context.read<PokedexBloc>().add(PokedexEventFetchPokemonList());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 3,
          ),
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            final pokemon = widget.data[index];
            return PokemonContainerGrid(
              pokemonName: pokemon.name.capitalizeFirstLetter(),
              pokemonNumber: pokemon.id.formatPokemonNumber(),
              pokemonImage: pokemon.sprites.originalImage!,
            );
          },
        ),
        const SizedBox(height: 8),
        widget.statusWidget,
      ],
    );
  }
}
