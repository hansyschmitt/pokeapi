class Pokemon {
  final String name;
  final int id;
  final String officialArtwork;
  final String mainImage;
  final String sprite;

  Pokemon({
    required this.name,
    required this.mainImage,
    required this.sprite,
    required this.officialArtwork,
    this.id = 0,
  });

  Pokemon copyWith({
    String? name,
    String? officialArtwork,
    String? mainImage,
    String? sprite,
    int? id,
  }) =>
      Pokemon(
        id: id ?? this.id,
        officialArtwork: officialArtwork ?? this.officialArtwork,
        name: name ?? this.name,
        sprite: sprite ?? this.sprite,
        mainImage: mainImage ?? this.mainImage,
      );

  @override
  String toString() => 'Pokemon(id:$id, name::$name, mainImage: $mainImage)';
}
