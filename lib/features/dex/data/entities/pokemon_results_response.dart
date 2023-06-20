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
    final parsedPokemons = (json['results'] as List?)
        ?.map((pokemon) => PokemonResponse.fromJson(pokemon))
        .toList();

    return PokemonResultResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      pokemons: parsedPokemons ?? [],
    );
  }

  List<Pokemon> toPokemonList() {
    return pokemons.map((element) {
      final url = element.url ?? '';
      final matchedId =
          RegExp(r'pokemon/([0-9]+)/').firstMatch(url)?.group(1) ?? '0';

      return Pokemon(
        name: element.name,
        url: url,
        id: int.parse(matchedId),
      );
    }).toList();
  }
}
