import 'package:flutter/material.dart';

class ThemeBackground extends StatelessWidget {
  final Widget child;
  const ThemeBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.primaryVariant,
            Theme.of(context).colorScheme.primary,
          ],
              stops: const [
            0.0,
            0.5,
            0.95
          ])),
      child: child,
    );
  }
}
