import 'package:VoyagApp/models/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripOverview extends StatelessWidget {
  final Function setDate;
  final Trip myTrip;
  final String cityName;
  final double amount;

  TripOverview({this.setDate, this.myTrip, this.cityName, this.amount});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(10),
      height: 150,
      color: Colors.white,
      width: orientation == Orientation.landscape
          ? size.width * 0.5
          : double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            cityName,
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                myTrip.date != null
                    ? DateFormat("d/M/y").format(myTrip.date)
                    : "Saisir une date",
                style: const TextStyle(fontSize: 18),
              )),
              RaisedButton(
                child: const Text("Choix date"),
                onPressed: setDate,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: const Text(
                "Montant par personne :",
                style: TextStyle(fontSize: 18),
              )),
              Text(
                "$amount €",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
