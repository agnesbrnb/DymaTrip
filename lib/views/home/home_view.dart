// Definition of HomePage with StatefulWidget

import 'package:VoyagApp/models/city_model.dart';
import 'package:VoyagApp/views/home/widgets/city_card.dart';
import 'package:VoyagApp/widgets/ask_modal.dart';
import 'package:VoyagApp/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static String routeName = '/';

  // Cette fonction va retourner une instance de HomeState à chaque modification de l'état et donc de HomeState
  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

// Etat de l'application, ne peut pas être utiliser en dehors de home.dart
class _HomeViewState extends State<HomeView> {
  // Liste de destination
  List loc = [
    City(name: "Parigné Cheval Aventures", image: "assets/images/pca.jpg"),
    City(name: "DisneyLand", image: "assets/images/disney.jpg"),
    City(name: "FenouilLand", image: "assets/images/fenouil.PNG")
  ];

  openModal(context) {
    askModal(context, "Tu aimes les frites ?").then((result) {
      print(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("DymaTrip")),
        drawer: MyDrawer(),
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Itération sur la liste de destination pour afficher les Card
              ...loc.map((city) {
                return CityCard(city: city);
              }),
              RaisedButton(
                child: Text("modal"),
                onPressed: () {
                  openModal(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}