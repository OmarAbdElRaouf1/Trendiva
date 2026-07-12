class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
    this.description = '',
    this.coverPictureUrl = '',
  });

  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      coverPictureUrl: json['coverPictureUrl'] as String? ?? '',
    );
  }
}
