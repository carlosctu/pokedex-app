import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_system/poke_system.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/bloc/pokedex_bloc.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/bloc/pokedex_bloc_event.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/bloc/pokedex_bloc_state.dart';
import 'package:pokedex_flutter_app/pages/pokedex_page/widgets/pokedex_container_grid.dart';
import 'package:pokedex_flutter_app/shared/ui/skeletons/pokedex_loading_skeleton.dart';

class PokedexBody extends StatefulWidget {
  const PokedexBody({super.key});

  @override
  State<PokedexBody> createState() => _PokedexBodyState();
}

class _PokedexBodyState extends State<PokedexBody> {
  PokedexBloc get pokedexBloc => context.read<PokedexBloc>();

  @override
  void initState() {
    pokedexBloc.add(PokedexEventFetchPokemonList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();

    return BlocBuilder<PokedexBloc, PokedexState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.fromLTRB(4, 0, 4, 4),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 24,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: StreamBuilder(
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
                  final isLoadingList = data.data.isEmpty;
                  if (isLoadingList) {
                    return const PokedexLoadingSkeleton(
                      skeletonItems: 15,
                    );
                  }
                  return PokedexContainerGrid(
                    data: data.data,
                    statusWidget: const ProgressLoader(),
                    isLoading: true,
                  );
                }
              }
              if (state is PokedexErrorState) {
                final data = snapshot.data as PokedexErrorState;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: theme.colors.identityGroup.primary,
                      showCloseIcon: true,
                      content: const Text("Please try again, later."),
                    ),
                  );
                });

                return PokedexContainerGrid(
                  data: data.data,
                  statusWidget: const SizedBox.shrink(),
                  isLoading: false,
                );
              }
              print(state);
              return Center(
                child: Text(
                  'No data',
                  style: theme.typography.h1,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
