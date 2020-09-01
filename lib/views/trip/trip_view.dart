import 'package:VoyagApp/models/city_model.dart';
import 'package:VoyagApp/models/trip_model.dart';
import 'package:VoyagApp/views/trip/widgets/trip_activities.dart';
import 'package:VoyagApp/views/trip/widgets/trip_city_bar.dart';

import 'package:flutter/material.dart';

class TripView extends StatefulWidget {
  static const String routeName = '/trip';
  final Trip trip;
  final City city;

  TripView({this.trip, this.city});
  @override
  _TripViewState createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            TripCityBar(
              city: widget.city,
            ),
            TripActivities(activities: widget.trip.activity)
          ],
        ),
      ),
    ));
  }
}
