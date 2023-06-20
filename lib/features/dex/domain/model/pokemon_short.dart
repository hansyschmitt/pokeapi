class PokemonShort {
  final String name;
  final String url;
  final int id;
  PokemonShort({
    required this.name,
    required this.url,
    this.id = 0,
  });

  PokemonShort copyWith({
    String? name,
    String? url,
    int? id,
  }) =>
      PokemonShort(
        name: name ?? this.name,
        id: id ?? this.id,
        url: url ?? this.url,
      );
}
