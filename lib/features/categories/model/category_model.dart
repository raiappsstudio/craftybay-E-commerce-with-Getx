class CategoryModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String icon;
  final String parent;
  final String createdAt;
  final String updatedAt;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.slug,
      required this.description,
      required this.icon,
      required this.parent,
      required this.createdAt,
      required this.updatedAt});

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      id: jsonData['_id'],
      title: jsonData['title'] ?? '',
      slug: jsonData['slug'] ?? '',
      description: jsonData['description'],
      icon: jsonData['icon'] ?? '',
      parent: jsonData['parent'] ?? '',
      createdAt: jsonData['createdAt'] ?? '',
      updatedAt: jsonData['updatedAt'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "title": title,
      "slug": slug,
      "description": description,
      "icon": icon,
      "parent": parent,
      "createdAt": createdAt,
      "updatedAt": updatedAt
    };
  }
}
