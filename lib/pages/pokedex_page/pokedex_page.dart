import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/widgets/pokedex_app_bar.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/widgets/pokedex_container_grid.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();

    return Scaffold(
      backgroundColor: theme.colors.identityGroup.primary,
      body: const SafeArea(
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: PokedexAppBar(),
            ),
            SliverFillRemaining(
              child: PokedexContainerGrid(),
            ),
          ],
        ),
      ),
    );
  }
}