import 'package:VoyagApp/city_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // Cette fonction va retourner une instance de HomeState à chaque modification de l'état et donc de HomeState
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

// Etat de l'application, ne peut pas être utiliser en dehors de home.dart
class _HomeState extends State<Home> {
  // Liste de destination
  List loc = [
    {
      'name': "Parigné Cheval Aventures",
      'image': "assets/images/pca.jpg",
      'checked': false
    },
    {
      'name': "DisneyLand",
      'image': "assets/images/disney.jpg",
      'checked': false
    },
    {'name': "Annecy", 'image': "assets/images/annecy.jpg", 'checked': false}
  ];

  // Switch l'état de l'étoile pour liker une destination
  void switchChecked(city) {
    int index = loc.indexOf(city);
    // Indique qu'il y a eu un changement d'état
    setState(() {
      loc[index]['checked'] = !loc[index]['checked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.attach_money),
          title: Text("DymaTrip"),
          actions: <Widget>[Icon(Icons.hot_tub)],
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Itération sur la liste de destination pour afficher les Card
              ...loc.map((city) {
                return CityCard(
                  name: city['name'],
                  image: city['image'],
                  checked: city['checked'],
                  updateChecked: () {
                    switchChecked(city);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
