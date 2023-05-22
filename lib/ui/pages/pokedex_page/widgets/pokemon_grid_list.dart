import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_system/poke_system.dart';
import 'package:pokedex_flutter_app/domain/bloc/pokedex_bloc.dart';
import 'package:pokedex_flutter_app/domain/bloc/pokedex_bloc_event.dart';
import 'package:pokedex_flutter_app/domain/entities/pokemon/pokemon_details_response.dart';
import 'package:pokedex_flutter_app/ui/pages/details_page/pokemon_details_page.dart';
import 'package:pokedex_flutter_app/ui/pages/pokedex_page/widgets/pokemon_card.dart';
import 'package:pokedex_flutter_app/utils/extensions/extensions.dart';

class PokemonGridList extends StatefulWidget {
  final List<PokemonDetailsResponse> data;
  final Widget statusWidget;
  final bool isLoading;
  const PokemonGridList({
    Key? key,
    required this.data,
    required this.statusWidget,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<PokemonGridList> createState() => _PokemonGridListState();
}

class _PokemonGridListState extends State<PokemonGridList> {
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
            final pokemonDetails = widget.data[index];
            return GestureDetector(
              onTap: () => _navigateToDetailsPage(pokemonDetails.id),
              child: _buildPokemonCard(pokemonDetails),
            );
          },
        ),
        const SizedBox(height: 8),
        widget.statusWidget,
      ],
    );
  }

  Widget _buildPokemonCard(PokemonDetailsResponse pokemonDetails) {
    final theme = PokeThemeData();
    return Hero(
      tag: pokemonDetails.id,
      child: PokemonCard(
        theme: theme,
        pokemonName: pokemonDetails.name.capitalizeFirstLetter(),
        pokemonNumber: pokemonDetails.id.formatPokemonNumber(),
        pokemonImage: pokemonDetails.sprites.originalImage!,
      ),
    );
  }

  _navigateToDetailsPage(int pokemonId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PokemonDetailsPage(
          data: widget.data,
          pokemonId: pokemonId - 1,
        ),
      ),
    );
  }
}
