import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokedex_text_style.dart';
import 'package:pokedex/core/helpers/font_helpers.dart';

class SearchBox extends StatelessWidget {
  final String hintText;
  final Widget? leading;
  final ValueChanged<String>? onChanged;
  const SearchBox({
    super.key,
    required this.hintText,
    this.leading,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SearchBar(
        onChanged: onChanged,
        leading: leading,
        hintText: hintText,
        hintStyle: FontHelpers.toMaterialStateProperty<TextStyle>(
          PokedexTextStyles.body3,
        ),
      ),
    );
  }
}
