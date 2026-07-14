class OfferModel {
  const OfferModel({
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

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      coverUrl: json['coverUrl'] as String? ?? '',
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? ''),
    );
  }
}
