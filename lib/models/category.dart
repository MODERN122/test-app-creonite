class CategoryList {
  CategoryList({
    required this.items,
  });
  late final List<Category> items;

  CategoryList.fromJson(Map<String, dynamic> json) {
    items = List.from(json['items']).map((e) => Category.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Category {
  Category({
    required this.id,
    required this.title,
    required this.slug,
  });
  late final int id;
  late final String title;
  late final String slug;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['slug'] = slug;
    return _data;
  }
}
