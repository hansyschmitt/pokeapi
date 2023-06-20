enum FilterMode { name, number }

extension Name on FilterMode {
  String get name => toString().toLowerCase().replaceAll('filtermode.', '');
}
