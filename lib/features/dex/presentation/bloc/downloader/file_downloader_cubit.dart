import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/dex/presentation/bloc/downloader/file_downloader_state.dart';

class FileDownloaderCubit extends Cubit<FileDownloaderState> {
  final PokemonRepository _pokemonRepository;

  FileDownloaderCubit(this._pokemonRepository)
      : super(InitialFileDownloaderState());

  void fetchImage(int pokemonId) async {
    emit(LoadingFileDownloaderState());
    final result = await _pokemonRepository.fetchPokemonData(pokemonId);
    if (!isClosed) {
      result.fold((l) => emit(FailureFileDownloaderState()), (pokemon) {
        return emit(SuccessFileDownloaderState(pokemon: pokemon));
      });
    }
  }
}
