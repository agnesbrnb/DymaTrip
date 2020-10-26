import 'package:VoyagApp/models/activity_model.dart';
import 'package:flutter/material.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;

  TripActivityList({this.activities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, a) {
          Activity activity = activities[a];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
              ),
              key: ValueKey(activity.id),
              child: Card(
                child: ListTile(
                  title: Text(activity.name),
                ),
              ),
              onDismissed: (_) {
                print("dismissed");
              },
            ),
          );
        });
  }
}
