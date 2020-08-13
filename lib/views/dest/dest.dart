import 'package:VoyagApp/views/dest/widgets/activity_saved.dart';
import 'package:flutter/material.dart';
import 'package:VoyagApp/datas/data.dart' as list_act;

import 'package:VoyagApp/models/activity_model.dart';
import 'package:VoyagApp/models/trip_model.dart';

import 'package:VoyagApp/views/dest/widgets/activity_list.dart';
import 'package:VoyagApp/views/dest/widgets/trip_overview.dart';

class Destination extends StatefulWidget {
  // Liste d'activité à faire dans la ville issue d'un modèle
  final List<Activity> activities = list_act.activities;

  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  Trip trip;
  int index;

  @override
  void initState() {
    super.initState();
    trip = Trip(city: "DisneyLand", idActivities: [], date: null);
    index = 0;
  }

  // Get the selected activities
  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => trip.idActivities.contains(activity.id))
        .toList();
  }

  void setDate() {
    // Date Picker qui commence le lendemain et fini un an après la date du jour
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((newDate) {
      // Si une nouvelle date est séléctionnée, attribuer à l'attribut myTrip
      if (newDate != null) {
        setState(() {
          trip.date = newDate;
        });
      }
    });
  }

  // Rechargé l'ui quand l'index change donc au clique sur la bottombar
  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  // Selectionner/Déselectionner une activité
  void toggleActivity(String id) {
    // Si l'activité a déjà été enregistrée on la retire, sinon on la sauvegarde
    setState(() {
      trip.idActivities.contains(id)
          ? trip.idActivities.remove(id)
          : trip.idActivities.add(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Organiser mon voyage"),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TripOverview(
              setDate: setDate,
              myTrip: trip,
            ),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: widget.activities,
                      selectedActivities: trip.idActivities,
                      toggleActivity: toggleActivity,
                    )
                  : ActivitySaved(
                      activities: tripActivities,
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // permet d'activer le bouton suivant l'index
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.map), title: Text("Découvrir")),
          BottomNavigationBarItem(
              icon: Icon(Icons.stars), title: Text("Mes activités")),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
