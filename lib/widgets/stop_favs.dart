import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toulouse_public_transport_tools/widgets/departures.dart';

class StopFavs extends StatefulWidget {
  @override
  _StopFavsState createState() => _StopFavsState();
}

class _StopFavsState extends State<StopFavs> {
  Key _refreshKey = UniqueKey();

  void _manualReload() => setState(() {
        _refreshKey = UniqueKey();
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Departures(
              stopId: 7060,
              width: 250,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _manualReload,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
