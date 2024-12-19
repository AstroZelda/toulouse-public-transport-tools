class StopArea {
  final String cityId;
  final String cityName;
  final String id;
  final String name;

  StopArea({
    required this.cityId,
    required this.cityName,
    required this.id,
    required this.name,
  });

  factory StopArea.fromJson(Map<String, dynamic> json) {
    return StopArea(
      cityId: json['cityId'],
      cityName: json['cityName'],
      id: json['id'],
      name: json['name'],
    );
  }
}