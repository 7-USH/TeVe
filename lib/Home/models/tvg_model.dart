class Tvg {
  String? id;
  String? name;
  String? url;

  Tvg({this.id, this.name, this.url});

  Tvg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
