import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_colors.dart';
import 'package:pokedex/core/constants/pokedex_dimens.dart';
import 'package:pokedex/core/constants/pokedex_text_style.dart';
import 'package:pokedex/features/dex/domain/model/pokemon_short.dart';
import 'package:pokedex/core/helpers/string_helpers.dart';
import 'package:pokedex/features/dex/presentation/widgets/image_fetcher.dart';

class PokemonCard extends StatelessWidget {
  final PokemonShort pokemon;
  final VoidCallback? onTap;

  const PokemonCard({
    super.key,
    required this.pokemon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: LayoutBuilder(builder: (context, constraints) {
                return Container(
                  height: constraints.maxHeight * 0.40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PokedexColor.lowGray,
                    ),
                    color: PokedexColor.lowGray,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(PokedexDimens.large),
                    ),
                  ),
                );
              }),
            ),
            Column(
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
                  child: ImageFetcher(
                    pokemonId: pokemon.id,
                  ),
                ),
                Text(
                  pokemon.name,
                  style: PokedexTextStyles.body3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
