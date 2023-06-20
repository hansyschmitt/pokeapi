import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_dimens.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: PokedexDimens.xxxxLarge,
      width: PokedexDimens.xxxxLarge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
