import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_dimens.dart';
import 'package:pokedex/core/constants/pokedex_text_style.dart';
import 'package:pokedex/core/helpers/font_helpers.dart';
import 'package:pokedex/features/dex/presentation/widgets/filter_widget.dart';

class PokemonSearchBar extends StatelessWidget {
  final String hintText;
  final Widget? leading;
  const PokemonSearchBar({
    super.key,
    required this.hintText,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchBar(
            leading: leading,
            hintText: hintText,
            hintStyle: FontHelpers.toMaterialStateProperty<TextStyle>(
              PokedexTextStyles.body,
            ),
          ),
        ),
        const SizedBox(width: PokedexDimens.large),
        const FilterWidget(),
      ],
    );
  }
}
