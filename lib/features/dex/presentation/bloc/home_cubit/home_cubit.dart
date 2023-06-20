import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dex/domain/model/pokemon_short.dart';
import 'package:pokedex/features/dex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/dex/presentation/bloc/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<PokemonShort> pokemons = [];

  final PokemonRepository _pokemonRepository;
  HomeCubit(this._pokemonRepository) : super(InitialHomeState()) {
    fetch();
  }

  Future<void> fetch() async {
    emit(LoadingHomeState());
    final result = await _pokemonRepository.fetchPokemons();
    result.fold((failure) => emit(ErrorHomeState()), (loadedPokemons) {
      pokemons = loadedPokemons;
      if (loadedPokemons.isEmpty) {
        emit(EmptyHomeState());
      } else {
        emit(SuccessHomeState(pokemons: pokemons));
      }
    });
  }

  Future<void> resetFilter() async {
    emit(SuccessHomeState(pokemons: pokemons));
  }

  Future<void> setFilter(String? filter) async {
    if (filter != null) {
      emit(SuccessHomeState(
          pokemons: pokemons
              .where((pokemon) => pokemon.name.contains(filter))
              .toList()));
    } else {
      resetFilter();
    }
  }

  void setSort(bool sortType) {
    final copyPk = pokemons;
    if (!sortType) {
      copyPk.sort((previous, next) => previous.id.compareTo(next.id));
    }

    emit(SuccessHomeState(
      pokemons: copyPk,
    ));
  }
}
