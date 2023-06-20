import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_colors.dart';
import 'package:pokedex/core/constants/pokedex_dimens.dart';

class PokemonListContainer extends StatelessWidget {
  final Widget child;
  const PokemonListContainer({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        padding: const EdgeInsets.only(
          left: PokedexDimens.small,
          right: PokedexDimens.small,
          top: PokedexDimens.xLarge,
        ),
        decoration: BoxDecoration(
          color: PokedexColor.white,
          border: Border.all(color: PokedexColor.white),
          borderRadius: const BorderRadius.all(
            Radius.circular(PokedexDimens.large),
          ),
        ),
        child: child,
      ),
    );
  }
}
