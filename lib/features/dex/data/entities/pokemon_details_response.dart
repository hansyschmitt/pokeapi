import 'package:pokedex/features/dex/data/entities/pokemon_details_sprite.dart';
import 'package:pokedex/features/dex/domain/model/pokemon.dart';

class PokemonDetailsResponse {
  final int id;
  final String name;
  final PokemonDetailsSprite sprite;

  PokemonDetailsResponse({
    required this.id,
    required this.name,
    required this.sprite,
  });

  factory PokemonDetailsResponse.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsResponse(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      sprite: PokemonDetailsSprite.fromJson(json),
    );
  }

  Pokemon toPokemon() => Pokemon(
        id: id,
        name: name,
        mainImage: sprite.homeBackDefault,
        sprite: sprite.backDefault,
        officialArtwork: sprite.officialArtwork,
      );
}
