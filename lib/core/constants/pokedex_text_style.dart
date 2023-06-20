import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_colors.dart';

class PokedexTextStyles {
  static const TextStyle headline = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Colors.white,
  );

  static TextStyle body = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: PokedexColor.grayscale,
  );
}
