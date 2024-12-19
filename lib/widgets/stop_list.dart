import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopList extends StatelessWidget {
  const StopList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/cockroach-spinning.gif'),
          const SizedBox(height: 20),
          const Text('Liste d\'arrêts'),
        ],
      ),
    );
  }
}
