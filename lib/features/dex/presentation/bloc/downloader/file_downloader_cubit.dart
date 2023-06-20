import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dex/domain/model/pokemon.dart';
import 'package:pokedex/features/dex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/dex/presentation/bloc/downloader/file_downloader_state.dart';

class FileDownloaderCubit extends Cubit<FileDownloaderState> {
  final PokemonRepository _pokemonRepository;

  Map<int, Pokemon> pokemonCache = {};
  FileDownloaderCubit(this._pokemonRepository)
      : super(InitialFileDownloaderState());

  void fetchDetails(int pokemonId) async {
    emit(LoadingFileDownloaderState());

    final result = await _pokemonRepository.fetchPokemonData(pokemonId);
    if (!isClosed) {
      result.fold((l) => emit(FailureFileDownloaderState()), (pokemon) {
        return emit(
            SuccessFileDownloaderState(id: pokemonId, pokemon: pokemon));
      });
    }
  }
}
