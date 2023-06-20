import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/core/failures/failure.dart';
import 'package:pokedex/features/dex/domain/model/pokemon.dart';
import 'package:pokedex/features/dex/domain/repositories/pokemon_repository.dart';

class PokemonRemoteRepository extends PokemonRepository {
  final Dio dio;

  PokemonRemoteRepository({
    required this.dio,
  });

  @override
  Future<Either<List<Pokemon>, Failure>> fetchPokemons() {
    throw UnimplementedError();
  }
}
