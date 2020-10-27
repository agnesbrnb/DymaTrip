import 'package:VoyagApp/models/activity_model.dart';
import 'package:VoyagApp/views/trip/widgets/trip_activity_list.dart';
import 'package:flutter/material.dart';

class TripActivities extends StatelessWidget {
  final String tripId;

  TripActivities({this.tripId});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    text: "En cours",
                  ),
                  Tab(
                    text: "Terminé",
                  )
                ],
              ),
            ),
            Container(
              height: 600,
              child: TabBarView(
                children: [
                  TripActivityList(
                    filter: ActivityStatus.ongoing,
                    tripId: tripId,
                  ),
                  TripActivityList(
                    filter: ActivityStatus.done,
                    tripId: tripId,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
