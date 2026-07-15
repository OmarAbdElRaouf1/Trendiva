class CategoryEntity {
  const CategoryEntity({
    required this.id,
    required this.name,
    this.description = '',
    this.coverPictureUrl = '',
  });

  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;
}
