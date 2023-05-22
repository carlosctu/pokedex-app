import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';
import 'package:shimmer/shimmer.dart';

class PokedexLoadingSkeleton extends StatelessWidget {
  final int skeletonItems;
  const PokedexLoadingSkeleton({
    Key? key,
    required this.skeletonItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 3,
          ),
          itemCount: skeletonItems,
          itemBuilder: (BuildContext context, int index) {
            return const SkeletonCard();
          },
        ),
      ],
    );
  }
}

class SkeletonCard extends StatelessWidget {
  const SkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();

    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: theme.colors.greyScaleGroup.light,
          highlightColor: theme.colors.greyScaleGroup.white,
          child: Container(
            decoration: BoxDecoration(
              color: theme.colors.greyScaleGroup.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: theme.colors.greyScaleGroup.light,
                width: 1,
              ),
            ),
          ),
        ),
        Positioned.fill(
          bottom: 0,
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.4,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: theme.colors.greyScaleGroup.background.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: Image.asset(
            'assets/png/pokemon_skeleton.png',
            height: 72,
            color: theme.colors.greyScaleGroup.medium.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
