abstract class FilterState {
  final String? filter;
  FilterState({this.filter});

  FilterState copyWith({String? filter});
}

class NameFilterState extends FilterState {
  NameFilterState({String? filter}) : super(filter: filter);

  @override
  NameFilterState copyWith({String? filter}) =>
      NameFilterState(filter: filter ?? this.filter);
}

class NumberFilterState extends FilterState {
  NumberFilterState({String? filter}) : super(filter: filter);

  @override
  NumberFilterState copyWith({String? filter}) =>
      NumberFilterState(filter: filter ?? this.filter);
}
