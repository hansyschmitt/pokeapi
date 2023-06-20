import 'package:pokedex/features/dex/domain/model/pokemon.dart';

abstract class FileDownloaderState {}

class InitialFileDownloaderState extends FileDownloaderState {}

class LoadingFileDownloaderState extends FileDownloaderState {}

class SuccessFileDownloaderState extends FileDownloaderState {
  final Pokemon pokemon;
  final int id;
  SuccessFileDownloaderState({required this.id, required this.pokemon});
}

class FailureFileDownloaderState extends FileDownloaderState {}
