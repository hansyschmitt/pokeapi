import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_images.dart';

class NoPokemonYet extends StatelessWidget {
  const NoPokemonYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(PokedexImages.noPokemon);
  }
}
