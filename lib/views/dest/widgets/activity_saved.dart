import 'package:VoyagApp/models/activity_model.dart';
import 'package:flutter/material.dart';

class ActivitySaved extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteActivity;

  ActivitySaved({this.activities, this.deleteActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: activities.length == 0
          ? Container(
              alignment: Alignment.center,
              child: Text("Pas d'activité, depechez vous d'en ajouter !"))
          : ListView.builder(
              itemBuilder: (context, index) {
                var currentA = activities[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(currentA.image),
                    ),
                    title: Text(currentA.name),
                    subtitle: Text(currentA.city),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.green,
                      onPressed: () {
                        deleteActivity(currentA);
                        // Affiche une SnackBar sur le scaffold en dessous dans l'arbre des widgets
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: const Text("Activité supprimée"),
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 1),
                          action: SnackBarAction(
                            label: "annuler",
                            onPressed: () {
                              print("undo");
                            },
                          ),
                        ));
                      },
                    ),
                  ),
                );
              },
              itemCount: activities.length,
            ),
    );
  }
}
