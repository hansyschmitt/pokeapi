import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dex/presentation/bloc/downloader/file_downloader_cubit.dart';
import 'package:pokedex/features/dex/presentation/bloc/downloader/file_downloader_state.dart';
import 'package:pokedex/features/dex/presentation/features/detail/detail_page.dart';
import 'package:pokedex/injector/injector.dart';

class DetailScreen extends StatelessWidget {
  final int pokemonId;
  const DetailScreen({
    super.key,
    required this.pokemonId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FileDownloaderCubit>.value(
      value: Injector.i.resolve<FileDownloaderCubit>()..fetchDetails(pokemonId),
      child: Builder(builder: (context) {
        return BlocBuilder<FileDownloaderCubit, FileDownloaderState>(
            builder: (context, state) {
          if (state is SuccessFileDownloaderState) {
            return DetailPage(pokemon: state.pokemon);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
      }),
    );
  }
}
