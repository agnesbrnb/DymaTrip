// Definition of HomePage with StatefulWidget

import 'package:VoyagApp/models/city_model.dart';
import 'package:VoyagApp/views/home/widgets/city_card.dart';
import 'package:VoyagApp/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static String routeName = '/';
  final List<City> cities;

  HomeView({this.cities});

  // Cette fonction va retourner une instance de HomeState à chaque modification de l'état et donc de HomeState
  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

// Etat de l'application, ne peut pas être utiliser en dehors de home.dart
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("DymaTrip")),
        drawer: const MyDrawer(),
        body: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Itération sur la liste de destination pour afficher les Card
              ...widget.cities.map((city) {
                return CityCard(city: city);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
