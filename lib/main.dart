// Main file where App is launched

import 'package:VoyagApp/models/city_model.dart';
import 'package:VoyagApp/models/trip_model.dart';
import 'package:VoyagApp/providers/city_provider.dart';

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
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return CityProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          '/': (context) {
            return HomeView();
          },
          // '/city': (context) {
          //   return DestinationView();
          // }
        },
        // ignore: missing_return
        // onGenerateRoute: (settings) {
        //   switch (settings.name) {
        //     case DestinationView.routeName:
        //       {
        //         final City city = settings.arguments;
        //         return MaterialPageRoute(builder: (context) {
        //           return DestinationView(
        //             city: city,
        //             addTrip: addTrip,
        //           );
        //         });
        //       }
        //     case TripsView.routeName:
        //       {
        //         return MaterialPageRoute(builder: (context) {
        //           return TripsView(
        //             trips: trips,
        //           );
        //         });
        //       }
        //     case TripView.routeName:
        //       {
        //         return MaterialPageRoute(builder: (context) {
        //           // Recupère l'id et le nom du voyage depuis le pushNamed fait dans TripList
        //           String tripId =
        //               (settings.arguments as Map<String, String>)['tripId'];
        //           String cityName =
        //               (settings.arguments as Map<String, String>)['cityName'];
        //           return TripView(
        //             // Affiche le voyage correspondant
        //             trip: trips.firstWhere((trip) => trip.id == tripId),
        //             city:
        //                 widget.cities.firstWhere((city) => city.name == cityName),
        //           );
        //         });
        //       }
        //   }
        // },
      ),
    );
  }
}
