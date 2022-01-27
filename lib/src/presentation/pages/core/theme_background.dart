import 'package:expense_tracker/src/core/theme/light.dart';
import 'package:flutter/material.dart';

class ThemeBackground extends StatelessWidget {
  final Widget child;
  const ThemeBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: lightGradient),
      child: child,
    );
  }
}
