import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/dex/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final PokemonRepository _pokemonRepository;
  HomeCubit(this._pokemonRepository) : super(InitialHomeState()) {
    fetch();
  }

  Future<void> fetch() async {
    emit(LoadingHomeState());
    final result = await _pokemonRepository.fetchPokemons();
    result.fold((failure) => emit(ErrorHomeState()), (pokemons) {
      if (pokemons.isEmpty) {
        emit(EmptyHomeState());
      } else {
        emit(SuccessHomeState(pokemons: pokemons));
      }
    });
  }
}
