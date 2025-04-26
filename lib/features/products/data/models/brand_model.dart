class Brand {
  final String id;
  final String title;
  final String slug;
  final String icon;

  Brand({
    required this.id,
    required this.title,
    required this.slug,
    required this.icon,
  });

  factory Brand.fromJson(Map<String, dynamic> jsonData) {
    return Brand(
      id: jsonData['_id'],
      title: jsonData['title'],
      slug: jsonData['slug'],
      icon: jsonData['icon'],
    );
  }
}