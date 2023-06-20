import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/core/failures/failure.dart';
import 'package:pokedex/features/dex/data/entities/pokemon_results_response.dart';
import 'package:pokedex/features/dex/domain/failure/pokemon_failure.dart';
import 'package:pokedex/features/dex/domain/model/pokemon.dart';
import 'package:pokedex/features/dex/domain/repositories/pokemon_repository.dart';

class PokemonRemoteRepository extends PokemonRepository {
  final Dio dio;

  PokemonRemoteRepository({
    required this.dio,
  });

  @override
  Future<Either<Failure, List<Pokemon>>> fetchPokemons() async {
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
}
