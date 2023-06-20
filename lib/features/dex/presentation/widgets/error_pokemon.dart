import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_dimens.dart';
import 'package:pokedex/core/constants/pokedex_images.dart';
import 'package:pokedex/core/constants/pokedex_text_style.dart';

class ErrorPokemonWidget extends StatelessWidget {
  const ErrorPokemonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'We have not found the pokemon you are looking for',
          style: PokedexTextStyles.caption,
        ),
        const SizedBox(
          height: PokedexDimens.xxLarge,
        ),
        Image.asset(PokedexImages.error),
      ],
    );
  }
}
