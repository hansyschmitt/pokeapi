import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dex/presentation/bloc/filter_cubit.dart/filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(NumberFilterState());

  void changeFilterMethod() {
    emit(state is NameFilterState ? NumberFilterState() : NameFilterState());
  }
}
