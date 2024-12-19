import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/departures_response.dart';

class ApiService {
  Future<DeparturesResponse> fetchStopDepartures(int operatorCode, String lineId, [int? number]) async {
    final String? stopsSchedulesUri = dotenv.env['GET_STOPS_SCHEDULES_URI'];
    final String? apiKey = dotenv.env['API_KEY'];

    if (stopsSchedulesUri == null || apiKey == null) {
      throw StateError('Missing mandatory configuration variable');
    }

    final Uri uri = Uri.parse('$stopsSchedulesUri?key=$apiKey').replace(
      queryParameters: {
        'key': apiKey,
        'operatorCode': operatorCode.toString(),
        'lineId': lineId,
        if (number != null) 'number': number.toString(),
      }
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      return DeparturesResponse.fromJson(decoded);
    } else {
      throw Exception('failed to get departures data');
    }
  }
}
