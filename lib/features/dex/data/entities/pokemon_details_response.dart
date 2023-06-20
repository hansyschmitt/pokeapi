import 'package:pokedex/features/dex/data/entities/pokemon_details_sprite.dart';
import 'package:pokedex/features/dex/domain/model/pokemon.dart';
import 'package:pokedex/features/dex/domain/model/pokemon_enum.dart';

class PokemonDetailsResponse {
  final int id;
  final String name;
  final List<PokemonEnum> types;
  final PokemonDetailsSprite sprite;

  PokemonDetailsResponse({
    required this.id,
    required this.name,
    required this.sprite,
    required this.types,
  });

  factory PokemonDetailsResponse.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsResponse(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        sprite: PokemonDetailsSprite.fromJson(json),
        types: PokemonTypeHelpers.fromJson(json['types']));
  }

  Pokemon toPokemon() => Pokemon(
        id: id,
        name: name,
        mainImage: sprite.homeBackDefault,
        sprite: sprite.backDefault,
        officialArtwork: sprite.officialArtwork,
      );
}
