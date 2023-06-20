import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_colors.dart';

enum PokemonEnum {
  none,
  normal,
  fighting,
  flying,
  ground,
  poison,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
}

extension PokemonColorExtension on PokemonEnum {
  Color get color {
    return switch (this) {
      PokemonEnum.none => PokedexColor.none,
      PokemonEnum.normal => PokedexColor.normal,
      PokemonEnum.fighting => PokedexColor.fighting,
      PokemonEnum.flying => PokedexColor.flying,
      PokemonEnum.ground => PokedexColor.ground,
      PokemonEnum.poison => PokedexColor.poison,
      PokemonEnum.rock => PokedexColor.rock,
      PokemonEnum.bug => PokedexColor.bug,
      PokemonEnum.ghost => PokedexColor.ghost,
      PokemonEnum.steel => PokedexColor.steel,
      PokemonEnum.fire => PokedexColor.fire,
      PokemonEnum.water => PokedexColor.water,
      PokemonEnum.grass => PokedexColor.grass,
      PokemonEnum.electric => PokedexColor.electric,
      PokemonEnum.psychic => PokedexColor.psychic,
      PokemonEnum.ice => PokedexColor.ice,
      PokemonEnum.dragon => PokedexColor.dragon,
      PokemonEnum.dark => PokedexColor.dark,
      PokemonEnum.fairy => PokedexColor.fairy,
    };
  }
}

class PokemonTypeHelpers {
  static List<PokemonEnum> fromJson(Map<String, dynamic> json) {
    final pokemonList = List<PokemonEnum>.empty(growable: true);
    json.forEach((key, value) {});
    return pokemonList;
  }
}
