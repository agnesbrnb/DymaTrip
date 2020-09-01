import 'package:VoyagApp/models/activity_model.dart';
import 'package:VoyagApp/views/dest/widgets/activity_card.dart';
import 'package:flutter/material.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;
  final List<Activity> selectedActivities;
  final Function toggleActivity;

  ActivityList({this.activities, this.toggleActivity, this.selectedActivities});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
            // Nombre d'éléments souhaités par ligne
            crossAxisCount: 2,
            // espace entre les éléments de la liste
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            children: activities
                .map((a) => ActivityCard(
                      activity: a,
                      // Si l'activité en cours est dans la liste d'activité sélectionnée => donner un effet visuel
                      isSelected: selectedActivities.contains(a),
                      toggleActivity: () {
                        toggleActivity(a);
                      },
                    ))
                .toList()));
  }
}
