class Stop {
  final String id;
  final String name;
  final String operatorCode;

  Stop({
   required this.id,
   required this.name,
   required this.operatorCode,
});

  factory Stop.fromJson(Map<String, dynamic> json) {
    return Stop(
        id: json['id'],
        name: json['name'],
        operatorCode: json['operatorCode'],
    );
  }
}