import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_dimens.dart';

class FilterWidget extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  const FilterWidget({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: PokedexDimens.xxxxLarge,
        width: PokedexDimens.xxxxLarge,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: icon,
      ),
    );
  }
}
