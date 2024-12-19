class Line {
  final String bgXmlColor;
  final String color;
  final String fgXmlColor;
  final String id;
  final String name;
  final String network;
  final String shortName;

  Line({
    required this.bgXmlColor,
    required this.color,
    required this.fgXmlColor,
    required this.id,
    required this.name,
    required this.network,
    required this.shortName,
  });

  factory Line.fromJson(Map<String, dynamic> json) {
    return Line(
      bgXmlColor: json['bgXmlColor'],
      color: json['color'],
      fgXmlColor: json['fgXmlColor'],
      id: json['id'],
      name: json['name'],
      network: json['network'],
      shortName: json['shortName'],
    );
  }
}
