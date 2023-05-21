import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';

class ProgressLoader extends StatelessWidget {
  const ProgressLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();
    final color = theme.colors.identityGroup.primary;

    Widget getLoaderIndicator() {
      if (Platform.isIOS) {
        return CupertinoActivityIndicator(
          color: color,
        );
      }
      return CircularProgressIndicator(
        color: color,
        strokeWidth: 3,
      );
    }

    return Center(
      child: SizedBox(
        width: 24,
        height: 24,
        child: getLoaderIndicator(),
      ),
    );
  }
}
