import 'package:VoyagApp/models/activity_model.dart';
import 'package:VoyagApp/datas/data.dart' as list_act;
import 'package:VoyagApp/models/trip_model.dart';
import 'package:VoyagApp/views/dest/widgets/activity_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Destination extends StatefulWidget {
  // Liste d'activité à faire dans la ville issue d'un modèle
  final List<Activity> activities = list_act.activities;

  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  Trip myTrip = Trip(city: "DisneyLand", idCity: [], date: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("DisneyLand"),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: 150,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(DateFormat("d/M/y").format(myTrip.date))),
                      RaisedButton(
                        child: Text("Choix date"),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                  // Nombre d'éléments souhaités par ligne
                  crossAxisCount: 2,
                  // espace entre les éléments de la liste
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  children: widget.activities
                      .map((a) => ActivityCard(
                            activity: a,
                          ))
                      .toList()),
            ),
          ],
        ),
      ),
    );
  }
}
