class Categories {
  String? name;
  String? slug;

  Categories({this.name, this.slug});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}
