import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_dimens.dart';
import 'package:pokedex/core/constants/pokedex_images.dart';
import 'package:pokedex/core/constants/pokedex_text_style.dart';

class PokemonTitleBar extends StatelessWidget {
  const PokemonTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: PokedexDimens.verySmall,
          ),
          child: Image.asset(PokedexImages.pokeball),
        ),
        const SizedBox(
          width: PokedexDimens.large,
        ),
        const Text(
          'Pokédex',
          style: PokedexTextStyles.headline,
        ),
      ],
    );
  }
}
