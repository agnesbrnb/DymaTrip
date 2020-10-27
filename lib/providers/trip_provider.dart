import 'dart:collection';

import 'package:VoyagApp/models/activity_model.dart';
import 'package:flutter/widgets.dart';

import 'package:VoyagApp/models/trip_model.dart';
import 'package:VoyagApp/datas/data.dart' as data;

class TripProvider with ChangeNotifier {
  final List<Trip> _trips = data.trips;

  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

  void addTrip(Trip trip) {
    trips.add(trip);

    notifyListeners();
  }

  Trip getTripById(String tripId) =>
      trips.firstWhere((trip) => trip.id == tripId);

  void setActivityToDone(Activity activity) {
    activity.status = ActivityStatus.done;
    notifyListeners();
  }
}
