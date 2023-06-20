import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/constants/pokedex_colors.dart';
import 'package:pokedex/core/constants/pokedex_constants.dart';
import 'package:pokedex/core/constants/pokedex_dimens.dart';
import 'package:pokedex/features/dex/presentation/bloc/filter_cubit.dart/filter_cubit.dart';
import 'package:pokedex/features/dex/presentation/bloc/home_cubit/home_cubit.dart';
import 'package:pokedex/features/dex/presentation/bloc/home_cubit/home_state.dart';
import 'package:pokedex/features/dex/presentation/features/detail/detail_screen.dart';
import 'package:pokedex/features/dex/presentation/widgets/pokemon_listings/error_pokemon.dart';
import 'package:pokedex/features/dex/presentation/widgets/pokemon_listings/no_pokemon_widget.dart';
import 'package:pokedex/features/dex/presentation/widgets/pokemon_listings/pokemon_card.dart';
import 'package:pokedex/features/dex/presentation/widgets/pokemon_listings/pokemon_list_container.dart';
import 'package:pokedex/features/dex/presentation/widgets/search_bar/pokemon_search_bar.dart';
import 'package:pokedex/features/dex/presentation/widgets/title_bar/pokemon_title_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PokedexColor.red,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: PokedexDimens.large),
                  child: Column(
                    children: [
                      const PokemonTitleBar(),
                      const SizedBox(height: PokedexDimens.small),
                      PokemonSearchBar(
                        hintText: 'Search',
                        onChanged: (filter) =>
                            context.read<FilterCubit>().setFilter(filter),
                        leading: const Icon(
                          Icons.search,
                          color: PokedexColor.red,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: PokedexDimens.xLarge),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return PokemonListContainer(child:
                          BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                        if (state is EmptyHomeState) {
                          return const NoPokemonYet();
                        }
                        if (state is LoadingHomeState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is ErrorHomeState) {
                          return const ErrorPokemonWidget();
                        }
                        if (state is SuccessHomeState) {
                          return GridView.builder(
                            itemCount: state.pokemons.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: PokemonConstants.colsPerRow,
                            ),
                            itemBuilder: (context, index) => PokemonCard(
                              pokemon: state.pokemons[index],
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    pokemonId: state.pokemons[index].id,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      }));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
