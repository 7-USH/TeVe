class Languages {
  String? name;
  String? code;

  Languages({
    this.name,
    this.code,
  });

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}
