import 'package:VoyagApp/models/activity_model.dart';
import 'package:flutter/material.dart';

class TripActivities extends StatelessWidget {
  final List<Activity> activities;

  TripActivities({this.activities});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: "En cours",
                ),
                Tab(
                  text: "Terminé",
                )
              ],
            ),
            Container(
              height: 600,
              child: TabBarView(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
