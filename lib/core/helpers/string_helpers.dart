extension PokemonHelpers on int {
  String formatter() {
    return '#${toString().padLeft(3, '0')}';
  }
}
