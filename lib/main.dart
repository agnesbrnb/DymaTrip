import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Home());
  }
}
