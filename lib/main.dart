import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_system/poke_system.dart';
import 'package:pokedex_flutter_app/data/repository/pokedex_repository.dart';
import 'package:pokedex_flutter_app/domain/bloc/pokedex_bloc.dart';
import 'package:pokedex_flutter_app/ui/routes/routes.dart';

void main() {
  runApp(const PokedexFlutterApp());
}

class PokedexFlutterApp extends StatelessWidget {
  const PokedexFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PokedexRepository>(
          create: (context) => PokedexRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PokedexBloc>(
            create: (context) => PokedexBloc(
              context.read<PokedexRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Pokedex Flutter App',
          debugShowCheckedModeBanner: false,
          theme: PokeThemeData().themeData,
          initialRoute: PathRoutes.pokedex,
          onGenerateRoute: onGenerateRoute,
        ),
      ),
    );
  }
}
