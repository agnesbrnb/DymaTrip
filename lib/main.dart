// Main file where App is launched

import 'package:VoyagApp/views/dest/dest_view.dart';
import 'package:VoyagApp/views/home/home_view.dart';
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
      routes: {
        '/': (context) {
          return HomeView();
        },
        '/city': (context) {
          return DestinationView();
        },
      },
      // onGenerateRoute: (settings) {
      //   print(settings);
      //   if (settings.name == '/city') {
      //     final City city = settings.arguments;
      //     return MaterialPageRoute(builder: (context) {
      //       return DestinationView(
      //         city: city,
      //       );
      //     });
      //   }
      // },
    );
  }
}
