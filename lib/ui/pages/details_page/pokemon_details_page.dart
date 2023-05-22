import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';
import 'package:pokedex_flutter_app/domain/entities/pokemon/pokemon_details_response.dart';
import 'package:pokedex_flutter_app/ui/pages/details_page/widgets/pokemon_information.dart';
import 'package:pokedex_flutter_app/utils/extensions/extensions.dart';

class PokemonDetailsPage extends StatefulWidget {
  final List<PokemonDetailsResponse> data;
  final int pokemonId;
  const PokemonDetailsPage({
    Key? key,
    required this.data,
    required this.pokemonId,
  }) : super(key: key);

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  late PokemonDetailsResponse pokemonDetails;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 1,
    );
    pokemonDetails = widget.data[widget.pokemonId];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();

    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            PokemonInformation(
              pokemonDetails: pokemonDetails,
            ),
            const _PokeballBackgroundImage(),
            _PokemonDetailsAppBar(
              pokemonData: pokemonDetails,
              theme: theme,
            ),
            Positioned(
              top: 80,
              child: Container(
                height: 240,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: pokemonDetails.id,
                  child: PageView.builder(
                    controller: pageController,
                    allowImplicitScrolling: true,
                    itemCount: widget.data.length,
                    onPageChanged: (value) {
                      final newIndex = widget.pokemonId + value;
                      pokemonDetails = widget.data[newIndex];
                      setState(() {});
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        pokemonDetails.sprites.originalImage!,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PokemonDetailsAppBar extends StatelessWidget {
  final PokeThemeData theme;
  final PokemonDetailsResponse pokemonData;
  const _PokemonDetailsAppBar({
    required this.pokemonData,
    required this.theme,
  });

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
          _buildLeading(context),
          _buildTrailing(),
        ],
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    return Row(
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
    );
  }

  Widget _buildTrailing() {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Text(
        pokemonData.id.formatPokemonNumber(),
        style: theme.typography.s1.copyWith(
          color: theme.colors.greyScaleGroup.white,
        ),
      ),
    );
  }
}

class _PokeballBackgroundImage extends StatelessWidget {
  const _PokeballBackgroundImage();

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: AlignmentDirectional.topEnd,
      child: Image.asset(
        'assets/png/pokeball_background.png',
        height: 208,
        width: 206,
        color: theme.colors.greyScaleGroup.white.withOpacity(0.2),
      ),
    );
  }
}
