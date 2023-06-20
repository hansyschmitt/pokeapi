import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/core/failures/failure.dart';
import 'package:pokedex/features/dex/data/entities/pokemon_details_response.dart';
import 'package:pokedex/features/dex/data/entities/pokemon_results_response.dart';
import 'package:pokedex/features/dex/domain/failure/pokemon_failure.dart';
import 'package:pokedex/features/dex/domain/model/pokemon.dart';
import 'package:pokedex/features/dex/domain/model/pokemon_short.dart';
import 'package:pokedex/features/dex/domain/repositories/pokemon_repository.dart';

class PokemonRemoteRepository extends PokemonRepository {
  final Dio dio;
  final Map<int, Pokemon> pokemonCache = {};

  PokemonRemoteRepository({
    required this.dio,
  });

  @override
  Future<Either<Failure, List<PokemonShort>>> fetchPokemons() async {
    try {
      final result = await dio.get('https://pokeapi.co/api/v2/pokemon/');
      if (result.statusCode == 200) {
        final data = result.data as Map<String, dynamic>;
        return Right(PokemonResultResponse.fromJson(data).toPokemonList());
      }
      return Left(PokemonFailure('Error while parsing the API'));
    } catch (e) {
      return Left(PokemonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Pokemon>> fetchPokemonData(int pokemonId) async {
    if (pokemonCache.containsKey(pokemonId)) {
      return Right(pokemonCache[pokemonId]!);
    } else {
      try {
        final result =
            await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');
        if (result.statusCode == 200) {
          final data = result.data as Map<String, dynamic>;
          final pokemonDetails =
              PokemonDetailsResponse.fromJson(data).toPokemon();
          pokemonCache[pokemonId] = pokemonDetails;
          return Right(pokemonDetails);
        }
        return Left(PokemonFailure('Error while parsing the API'));
      } catch (e) {
        return Left(PokemonFailure(e.toString()));
      }
    }
  }
}
