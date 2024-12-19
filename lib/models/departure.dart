import 'destination.dart';
import 'line.dart';

class Departure {
  final DateTime dateTime;
  final List<Destination> destination;
  final Line line;
  final bool realTime;

  Departure({
    required this.dateTime,
    required this.destination,
    required this.line,
    required this.realTime,
  });

  factory Departure.fromJson(Map<String, dynamic> json) {

    var destinationJson = json['destination'] as List;
    List<Destination> destinationList = destinationJson.map((i) => Destination.fromJson(i)).toList();


    return Departure(
      dateTime: DateTime.parse(json['dateTime']),
      destination: destinationList,
      line: Line.fromJson(json['line']),
      realTime: json['realTime'] == 'yes',
    );
  }
}