import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/constants/pokedex_colors.dart';
import 'package:pokedex/core/constants/pokedex_dimens.dart';
import 'package:pokedex/core/constants/pokedex_text_style.dart';
import 'package:pokedex/features/dex/presentation/bloc/filter_cubit.dart/filter_cubit.dart';
import 'package:pokedex/features/dex/presentation/bloc/filter_cubit.dart/filter_mode.dart';
import 'package:pokedex/features/dex/presentation/bloc/filter_cubit.dart/filter_state.dart';
import 'package:pokedex/injector/injector.dart';

Future<void> showSortDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const AlertDialog(
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        backgroundColor: PokedexColor.red,
        content: SortDialog(),
      );
    },
  );
}

class SortDialog extends StatelessWidget {
  const SortDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilterCubit>.value(
      value: Injector.i.resolve<FilterCubit>(),
      child: Builder(builder: (context) {
        return BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Sort by:',
                    style: PokedexTextStyles.subtitle2,
                  ),
                  const SizedBox(
                    height: PokedexDimens.large,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PokedexColor.lowGray,
                      ),
                      color: PokedexColor.lowGray,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(PokedexDimens.large),
                      ),
                    ),
                    child: Column(
                      children: [
                        RadioButtonItem(
                          name: 'Number',
                          value: 'number',
                          selectedValue: state.filterMode.name,
                          onSelected: () => context
                              .read<FilterCubit>()
                              .changeFilterMethod(FilterMode.number),
                        ),
                        RadioButtonItem(
                          name: 'Name',
                          selectedValue: state.filterMode.name,
                          value: 'name',
                          onSelected: () => context
                              .read<FilterCubit>()
                              .changeFilterMethod(FilterMode.name),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

class RadioButtonItem extends StatelessWidget {
  final String name;
  final String value;

  final String selectedValue;

  final VoidCallback? onSelected;
  const RadioButtonItem({
    super.key,
    required this.name,
    required this.value,
    required this.selectedValue,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: selectedValue,
          onChanged: (value) {
            onSelected?.call();
            Navigator.of(context).pop();
          },
        ),
        Text(name),
      ],
    );
  }
}
