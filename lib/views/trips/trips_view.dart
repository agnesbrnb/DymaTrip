import 'package:VoyagApp/models/trip_model.dart';
import 'package:VoyagApp/providers/trip_provider.dart';
import 'package:VoyagApp/views/trips/widgets/trip_list.dart';

import 'package:VoyagApp/widgets/drawer.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripsView extends StatelessWidget {
  static const String routeName = "/trips";

  @override
  Widget build(BuildContext context) {
    List<Trip> trips = Provider.of<TripProvider>(context).trips;

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
                trips: trips
                    .where((trip) => DateTime.now().isBefore(trip.date))
                    .toList(),
              ),
              TripList(
                trips: trips
                    .where((trip) => DateTime.now().isAfter(trip.date))
                    .toList(),
              ),
            ],
          )),
    );
  }
}
