import 'package:flutter/material.dart';

import '../models/departures_response.dart';
import '../services/api_service.dart';
import '../services/timedate_service.dart';

class Departures extends StatefulWidget {
  final int stopId;
  final double width; // default 175

  Departures({
    required this.stopId,
    this.width = 175,
  });

  @override
  _DeparturesState createState() => _DeparturesState();
}

class _DeparturesState extends State<Departures> {
  late Future<DeparturesResponse> _futureResponse;

  @override
  void initState() {
    super.initState();
    _futureResponse = ApiService().fetchStopDepartures(widget.stopId, 'line:144', 3);
  }

  void _loadData() {
    setState(() {
      // Fetch the data again (reloads the Future)
      _futureResponse = ApiService().fetchStopDepartures(widget.stopId, 'line:144', 3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<DeparturesResponse>(
            future: _futureResponse,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return SizedBox(
                  width: widget.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('L1 - Arrêt ${snapshot.data!.stop.name}'),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(TimeDateService.getHoursMinutesFromData(snapshot.data!)),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(TimeDateService.getMinutesUntilNowFromData(snapshot.data!).toString()),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(TimeDateService.getHoursMinutesFromData(snapshot.data!, 1)),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(TimeDateService.getMinutesUntilNowFromData(snapshot.data!, 1).toString()),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(TimeDateService.getHoursMinutesFromData(snapshot.data!, 2)),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(TimeDateService.getMinutesUntilNowFromData(snapshot.data!, 2).toString()),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const Text('No data found');
              }
            },
          ),
        ],
      );
  }
}
