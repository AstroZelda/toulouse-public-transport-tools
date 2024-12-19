import 'departure.dart';
import 'stop.dart';
import 'stopArea.dart';

class DeparturesResponse {
  final List<Departure> departures;
  final Stop stop;
  final StopArea stopArea;
  final DateTime expirationDate;

  DeparturesResponse({
    required this.departures,
    required this.stop,
    required this.stopArea,
    required this.expirationDate,
  });

  factory DeparturesResponse.fromJson(Map<String, dynamic> json) {
    var departuresJson = json['departures']['departure'] as List;
    List<Departure> departuresList = departuresJson.map((i) => Departure.fromJson(i)).toList();

    return DeparturesResponse(
        departures: departuresList,
        stop: Stop.fromJson(json['departures']['stop']),
        stopArea: StopArea.fromJson(json['departures']['stopArea']),
        expirationDate: DateTime.parse(json['expirationDate']),
    );
  }
}