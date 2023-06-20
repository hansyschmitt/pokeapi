class Pokemon {
  final String name;
  final String? details;
  final String url;
  final int id;
  Pokemon({
    required this.name,
    required this.url,
    this.details,
    this.id = 0,
  });

  Pokemon copyWith({
    String? name,
    String? url,
    int? id,
  }) =>
      Pokemon(
        name: name ?? this.name,
        id: id ?? this.id,
        url: url ?? this.url,
        details: details,
      );
}
