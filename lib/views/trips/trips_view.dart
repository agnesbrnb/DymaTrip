import 'package:VoyagApp/models/trip_model.dart';
import 'package:VoyagApp/views/trips/widgets/trip_list.dart';

import 'package:VoyagApp/widgets/drawer.dart';

import 'package:flutter/material.dart';

class TripsView extends StatefulWidget {
  static const String routeName = "/trips";
  final List<Trip> trips;

  TripsView({this.trips});

  @override
  _TripsViewState createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Mes Voyages"),
            bottom: TabBar(
              tabs: [
                const Tab(
                  text: "A venir",
                ),
                const Tab(
                  text: "Passé-s",
                )
              ],
            ),
          ),
          drawer: const MyDrawer(),
          body: TabBarView(
            children: [
              TripList(
                trips: widget.trips
                    .where((trip) => DateTime.now().isBefore(trip.date))
                    .toList(),
              ),
              TripList(
                trips: widget.trips
                    .where((trip) => DateTime.now().isAfter(trip.date))
                    .toList(),
              ),
            ],
          )),
    );
  }
}
