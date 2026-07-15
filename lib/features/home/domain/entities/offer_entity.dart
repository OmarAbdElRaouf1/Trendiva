class OfferEntity {
  const OfferEntity({
    required this.id,
    required this.name,
    this.description = '',
    this.coverUrl = '',
    this.createdAt,
  });

  final String id;
  final String name;
  final String description;
  final String coverUrl;
  final DateTime? createdAt;
}
