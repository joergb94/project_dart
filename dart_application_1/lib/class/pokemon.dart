class Pokemon {
  Pokemon({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
