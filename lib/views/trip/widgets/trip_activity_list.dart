import 'package:VoyagApp/models/activity_model.dart';
import 'package:VoyagApp/providers/trip_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final ActivityStatus filter;

  TripActivityList({this.activities, this.filter});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, a) {
          Activity activity = activities[a];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            // Permettre d'archiver l'activité que si elle est en cours
            child: filter == ActivityStatus.ongoing
                ? Dismissible(
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
                      Provider.of<TripProvider>(context, listen: false)
                          .setActivityToDone(activity);
                    },
                  )
                : Card(
                    child: ListTile(
                      title: Text(
                        activity.name,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
          );
        });
  }
}
