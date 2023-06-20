import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dex/presentation/bloc/filter_cubit.dart/filter_state.dart';
import 'package:pokedex/features/dex/presentation/bloc/home_cubit/home_cubit.dart';

class FilterCubit extends Cubit<FilterState> {
  final HomeCubit _homeCubit;
  FilterCubit(this._homeCubit) : super(NumberFilterState());

  void changeFilterMethod() {
    _homeCubit.setSort(state is NameFilterState);
    emit(state is NameFilterState
        ? NumberFilterState(filter: state.filter)
        : NameFilterState(filter: state.filter));
  }

  void clearFilter() {
    _homeCubit.resetFilter();
    emit(state.copyWith(filter: null));
  }

  void setFilter(String? filter) {
    _homeCubit.setFilter(filter);
    emit(state.copyWith(filter: filter));
  }
}
