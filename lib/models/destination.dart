class Destination {
  final String cityName;
  final String id;
  final String name;

  Destination({
    required this.cityName,
    required this.id,
    required this.name,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      cityName: json['cityName'],
      id: json['id'],
      name: json['name'],
    );
  }
}