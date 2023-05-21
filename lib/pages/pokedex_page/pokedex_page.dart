import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_system/poke_system.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/bloc/pokedex_bloc.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/bloc/pokedex_bloc_event.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/bloc/pokedex_bloc_state.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/widgets/pokedex_app_bar.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/widgets/pokedex_container_grid.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  PokedexBloc get pokedexBloc => context.read<PokedexBloc>();

  @override
  void initState() {
    pokedexBloc.add(PokedexEventFetchPokemonList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();

    return Scaffold(
      backgroundColor: theme.colors.identityGroup.primary,
      body: SafeArea(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: PokedexAppBar(),
            ),
            SliverFillRemaining(
              child: BlocBuilder<PokedexBloc, PokedexState>(
                builder: (context, state) {
                  return StreamBuilder(
                    stream: pokedexBloc.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data;
                        if (data is PokedexInitialState) {
                          return PokedexContainerGrid(
                            data: data.data,
                            statusWidget: const SizedBox.shrink(),
                            isLoading: false,
                          );
                        } else if (data is PokedexLoadingState) {
                          final isLoading = data.data.isNotEmpty;
                          return PokedexContainerGrid(
                            data: data.data,
                            statusWidget: const ProgressLoader(),
                            isLoading: isLoading,
                          );
                        }
                      }
                      return const Center(
                        child: Text('No data'),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
