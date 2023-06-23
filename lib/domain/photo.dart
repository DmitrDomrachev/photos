class Photo {
  final String urlFull;
  final String urlSmall;
  final String id;
  final String username;
  final int likes;

  const Photo({
    required this.urlSmall,
    required this.urlFull,
    required this.id,
    required this.username,
    required this.likes,
  });
}
