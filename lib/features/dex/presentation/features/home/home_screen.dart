import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_colors.dart';
import 'package:pokedex/core/constants/pokedex_dimens.dart';
import 'package:pokedex/features/dex/presentation/widgets/pokemon_card.dart';
import 'package:pokedex/features/dex/presentation/widgets/pokemon_list_container.dart';
import 'package:pokedex/features/dex/presentation/widgets/pokemon_search_bar.dart';
import 'package:pokedex/features/dex/presentation/widgets/pokemon_title_bar.dart';

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
              const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: PokedexDimens.large),
                  child: Column(
                    children: [
                      PokemonTitleBar(),
                      SizedBox(height: PokedexDimens.small),
                      PokemonSearchBar(
                        hintText: 'Search',
                        leading: Icon(
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
                  child: PokemonListContainer(
                      child: GridView.builder(
                    itemCount: 99,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) => const PokemonCard(),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
