import 'package:VoyagApp/models/activity_model.dart';
import 'package:flutter/material.dart';

class ActivitySaved extends StatelessWidget {
  final List<Activity> activities;

  ActivitySaved({this.activities});

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Text("Mes sauvegardes"),
      child: ListView.builder(
        itemBuilder: (context, index) {
          var currentA = activities[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(currentA.image),
              ),
              title: Text(currentA.name),
              subtitle: Text(currentA.city),
              trailing: Icon(Icons.delete),
            ),
          );
        },
        itemCount: activities.length,
      ),
    );
  }
}
