import 'package:VoyagApp/models/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripOverview extends StatelessWidget {
  final Function setDate;
  final Trip myTrip;

  TripOverview({this.setDate, this.myTrip});

  double get amount {
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 150,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Paris",
            style:
                TextStyle(fontSize: 25, decoration: TextDecoration.underline),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                myTrip.date != null
                    ? DateFormat("d/M/y").format(myTrip.date)
                    : "Saisir une date",
                style: TextStyle(fontSize: 18),
              )),
              RaisedButton(
                child: Text("Choix date"),
                onPressed: setDate,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                "Montant par personne :",
                style: TextStyle(fontSize: 18),
              )),
              Text(
                "$amount €",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
