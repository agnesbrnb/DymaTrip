import 'package:VoyagApp/models/city_model.dart';
import 'package:VoyagApp/views/dest/dest_view.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  // On peut utiliser final car on ne peut, de toute façon, pas changer les attributs d'un widget stateless
  final City city;

  // Constructeur de la classe CityCard
  CityCard({this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          height: 150,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              // Image avec effet visuel
              Ink.image(
                fit: BoxFit.cover,
                image: AssetImage(
                  city.image,
                ),
                // On click go to the city page
                child: InkWell(onTap: () {
                  Navigator.pushNamed(
                    context,
                    DestinationView.routeName,
                    arguments: city.name,
                  );
                }),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  city.name,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      backgroundColor: Colors.black54),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
