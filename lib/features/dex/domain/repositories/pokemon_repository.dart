import 'package:dartz/dartz.dart';
import 'package:pokedex/core/failures/failure.dart';
import 'package:pokedex/features/dex/domain/model/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<List<Pokemon>, Failure>> fetchPokemons();
}
