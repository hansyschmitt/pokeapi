import 'package:dartz/dartz.dart';
import 'package:pokedex/core/failures/failure.dart';
import 'package:pokedex/features/dex/domain/model/pokemon.dart';
import 'package:pokedex/features/dex/domain/model/pokemon_short.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonShort>>> fetchPokemons();
  Future<Either<Failure, Pokemon>> fetchPokemonData(int pokemonId);
}
