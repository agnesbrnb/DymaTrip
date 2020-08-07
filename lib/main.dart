// Main file where App is launched

import 'package:VoyagApp/views/dest/dest.dart';
import 'package:flutter/material.dart';

// import 'views/home/home.dart';

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
      // home: Home()
      home: Destination(),
    );
  }
}
