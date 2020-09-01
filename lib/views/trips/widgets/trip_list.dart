import 'package:VoyagApp/models/trip_model.dart';
import 'package:VoyagApp/views/trip/trip_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Affichage de la liste des voyages sauvegardés
class TripList extends StatelessWidget {
  final List<Trip> trips;

  TripList({this.trips});

  @override
  Widget build(BuildContext context) {
    // ListView boucle sur les voyages pour afficher les infos
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: (context, i) {
        var trip = trips[i];
        return ListTile(
          title: Text(trip.city),
          subtitle: trip.date != null
              ? Text(DateFormat("d/M/y").format(trip.date))
              : null,
          trailing: const Icon(Icons.info),
          onTap: () {
            Navigator.pushNamed(context, TripView.routeName, arguments: {
              'tripId': trip.id,
              'cityName': trip.city,
            });
          },
        );
      },
    );
  }
}
