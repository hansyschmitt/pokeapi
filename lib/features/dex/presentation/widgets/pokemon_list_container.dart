import 'package:flutter/material.dart';

class PokemonListContainer extends StatelessWidget {
  final Widget child;
  const PokemonListContainer({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      child: child,
    );
  }
}
