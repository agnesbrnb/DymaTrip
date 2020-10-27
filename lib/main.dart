// Main file where App is launched

import 'package:VoyagApp/providers/city_provider.dart';
import 'package:VoyagApp/providers/trip_provider.dart';
import 'package:VoyagApp/views/dest/dest_view.dart';

import 'package:VoyagApp/views/home/home_view.dart';
import 'package:VoyagApp/views/trip/trip_view.dart';
import 'package:VoyagApp/views/trips/trips_view.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// import 'views/home/home.dart';

void main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatefulWidget {
  // final List<City> cities = data.cities;

  @override
  _DymaTripState createState() => _DymaTripState();
}

class _DymaTripState extends State<DymaTrip> {
  // List<Trip> trips = data.trips;

  // Ajout d'un voyage
  // void addTrip(Trip trip) {
  //   setState(() {
  //     trips.add(trip);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CityProvider()),
        ChangeNotifierProvider.value(value: TripProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          '/': (context) => HomeView(),
          DestinationView.routeName: (_) => DestinationView(),
          TripsView.routeName: (_) => TripsView(),
          TripView.routeName: (_) => TripView(),
        },
      ),
    );
  }
}
