import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_colors.dart';
import 'package:pokedex/core/constants/pokedex_dimens.dart';

class PokedexTextStyles {
  static const TextStyle headline = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: PokedexDimens.xLargeFont,
    color: Colors.white,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: PokedexDimens.largeFont,
    color: Colors.white,
  );

  static const TextStyle body3 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: PokedexDimens.largeFont,
    color: PokedexColor.mediumGrayscale,
  );

  static const TextStyle caption = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: PokedexDimens.mediumFont,
    color: PokedexColor.mediumGrayscale,
  );
}
