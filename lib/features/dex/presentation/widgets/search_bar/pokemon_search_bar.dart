import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/constants/pokedex_colors.dart';
import 'package:pokedex/core/constants/pokedex_dimens.dart';
import 'package:pokedex/features/dex/presentation/bloc/filter_cubit.dart/filter_cubit.dart';
import 'package:pokedex/features/dex/presentation/bloc/filter_cubit.dart/filter_mode.dart';
import 'package:pokedex/features/dex/presentation/bloc/filter_cubit.dart/filter_state.dart';
import 'package:pokedex/features/dex/presentation/widgets/search_bar/filter_widget.dart';
import 'package:pokedex/features/dex/presentation/widgets/search_bar/search_box.dart';
import 'package:pokedex/features/dex/presentation/widgets/sort_dialog.dart';

class PokemonSearchBar extends StatelessWidget {
  final String hintText;
  final Widget? leading;
  final ValueChanged<String>? onChanged;

  const PokemonSearchBar({
    super.key,
    required this.hintText,
    this.leading,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchBox(
          hintText: hintText,
          leading: leading,
          onChanged: onChanged,
        ),
        const SizedBox(width: PokedexDimens.large),
        BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            final searchIcon = state.filterMode == FilterMode.name
                ? Icons.text_format
                : Icons.tag;
            return GestureDetector(
              onTap: () => showSortDialog(context),
              child: FilterWidget(
                icon: Icon(
                  searchIcon,
                  color: PokedexColor.red,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
