class ProductList {
  ProductList({
    required this.items,
    required this.pagination,
  });
  late final List<Product> items;
  late final Pagination pagination;

  ProductList.fromJson(Map<String, dynamic> json) {
    items = List.from(json['items']).map((e) => Product.fromJson(e)).toList();
    pagination = Pagination.fromJson(json['pagination']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Pagination {
  Pagination({
    required this.page,
    required this.pages,
    required this.total,
  });
  late final int page;
  late final int pages;
  late final int total;

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pages = json['pages'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['pages'] = pages;
    _data['total'] = total;
    return _data;
  }
}

class Product {
  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.price,
    required this.colors,
  });
  late final int id;
  late final String title;
  late final String slug;
  late final ProductImage image;
  late final int price;
  late final List<ProductColor> colors;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    image = ProductImage.fromJson(json['image']);
    price = json['price'];
    colors =
        List.from(json['colors']).map((e) => ProductColor.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['slug'] = slug;
    _data['image'] = image.toJson();
    _data['price'] = price;
    _data['colors'] = colors.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ProductImage {
  ProductImage({
    required this.file,
  });
  late final File file;

  ProductImage.fromJson(Map<String, dynamic> json) {
    file = File.fromJson(json['file']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['file'] = file.toJson();
    return _data;
  }
}

class File {
  File({
    required this.url,
    required this.name,
    required this.originalName,
    required this.extension,
    required this.size,
  });
  late final String url;
  late final String name;
  late final String originalName;
  late final String extension;
  late final String size;

  File.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    originalName = json['originalName'];
    extension = json['extension'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['name'] = name;
    _data['originalName'] = originalName;
    _data['extension'] = extension;
    _data['size'] = size;
    return _data;
  }
}

class ProductColor {
  ProductColor({
    required this.id,
    required this.title,
    required this.code,
  });
  late final int id;
  late final String title;
  late final String code;

  ProductColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['code'] = code;
    return _data;
  }
}
