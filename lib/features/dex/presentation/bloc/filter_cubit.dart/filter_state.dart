import 'package:pokedex/features/dex/presentation/bloc/filter_cubit.dart/filter_mode.dart';

class FilterState {
  final String? filter;
  final FilterMode filterMode;
  FilterState({
    this.filter,
    this.filterMode = FilterMode.number,
  });

  FilterState copyWith({
    String? filter,
    FilterMode? filterMode,
  }) =>
      FilterState(
          filter: filter ?? this.filter,
          filterMode: filterMode ?? this.filterMode);
}
