import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/constants/pokedex_images.dart';
import 'package:pokedex/features/dex/presentation/bloc/downloader/file_downloader_cubit.dart';
import 'package:pokedex/features/dex/presentation/bloc/downloader/file_downloader_state.dart';
import 'package:pokedex/features/dex/presentation/widgets/shimmer_loading.dart';
import 'package:pokedex/injector/injector.dart';

class ImageFetcher extends StatelessWidget {
  final int pokemonId;
  const ImageFetcher({
    super.key,
    required this.pokemonId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FileDownloaderCubit>(
      create: (_) => Injector.i.resolve<FileDownloaderCubit>(),
      child: Builder(builder: (context) {
        return BlocBuilder<FileDownloaderCubit, FileDownloaderState>(
            bloc: context.read<FileDownloaderCubit>()..fetchImage(pokemonId),
            builder: (context, state) {
              if (state is SuccessFileDownloaderState) {
                return Image.network(
                  state.pokemon.mainImage,
                );
              }
              return ShimmerLoading(
                isLoading: true,
                child: Image.asset(
                  PokedexImages.error,
                ),
              );
            });
      }),
    );
  }
}
