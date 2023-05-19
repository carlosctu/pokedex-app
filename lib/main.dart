import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Flutter App',
      debugShowCheckedModeBanner: false,
      theme: PokeThemeData().themeData,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();
    return Scaffold(
      backgroundColor: theme.colors.identityGroup.primary,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 8,
              ),
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
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SearchBar(
                    onSearchChanged: (value) => print(value),
                    onSearch: (value) {
                      print(value);
                    },
                    hintText: "Search",
                  ),
                  const SizedBox(width: 16),
                  const Text('Hello'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
