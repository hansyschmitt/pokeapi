class PokemonDetailsSprite {
  final String backDefault;
  final String homeBackDefault;
  final String officialArtwork;

  PokemonDetailsSprite({
    required this.backDefault,
    required this.homeBackDefault,
    required this.officialArtwork,
  });

  factory PokemonDetailsSprite.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsSprite(
      backDefault: json['sprites']?['back_default'] ?? '',
      homeBackDefault:
          json['sprites']?['other']?['home']?['front_default'] ?? '',
      officialArtwork: json['sprites']?['other']?['official-artwork']
              ?['front_default'] ??
          '',
    );
  }
}
