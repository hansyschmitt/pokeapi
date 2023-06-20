import 'package:pokedex/features/dex/data/entities/pokemon_response.dart';
import 'package:pokedex/features/dex/domain/model/pokemon.dart';

class PokemonResultResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonResponse> pokemons;
  PokemonResultResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.pokemons,
  });

  factory PokemonResultResponse.fromJson(Map<String, dynamic> json) {
    final parsedPokemons =
        json['pokemons']?.map((pokemon) => PokemonResponse.fromJson(pokemon));
    return PokemonResultResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      pokemons: parsedPokemons ?? [],
    );
  }

  List<Pokemon> toPokemonList() {
    return pokemons.map((element) => Pokemon()).toList();
  }
}
