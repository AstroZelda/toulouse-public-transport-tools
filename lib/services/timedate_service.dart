import 'package:intl/intl.dart';

import '../models/departures_response.dart';

class TimeDateService {

  static int getMinutesUntilNow(DateTime departureTime) {

    int difference = departureTime.difference(DateTime.now()).inMinutes;

    if (difference.isNegative) {
      return 0;
    } else {
      return difference;
    }
  }

  static String getHoursMinutes(DateTime departureTime) {
    return DateFormat('HH:mm').format(departureTime);
  }

  static int getMinutesUntilNowFromData(DeparturesResponse data, [int index = 0]) {
    return getMinutesUntilNow(data.departures[index].dateTime);
  }

  static String getHoursMinutesFromData(DeparturesResponse data, [int index = 0]) {
    return getHoursMinutes(data.departures[index].dateTime);
  }


}