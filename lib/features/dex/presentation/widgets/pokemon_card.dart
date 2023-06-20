import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_colors.dart';
import 'package:pokedex/core/constants/pokedex_dimens.dart';
import 'package:pokedex/core/constants/pokedex_text_style.dart';
import 'package:pokedex/features/dex/domain/model/pokemon.dart';
import 'package:pokedex/core/helpers/string_helpers.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(PokedexDimens.verySmall),
      decoration: BoxDecoration(
        border: Border.all(
          color: PokedexColor.mediumGrayscale,
        ),
        color: PokedexColor.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(PokedexDimens.large),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(
                top: PokedexDimens.verySmall,
                right: PokedexDimens.small,
              ),
              child: Text(
                pokemon.id.formatter(),
                style: PokedexTextStyles.caption,
              ),
            ),
          ),
          Expanded(
            child: Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png',
            ),
          ),
          Text(
            pokemon.name,
            style: PokedexTextStyles.body3,
          ),
        ],
      ),
    );
  }
}
