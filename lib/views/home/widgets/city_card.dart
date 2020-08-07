import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  // On peut utiliser final car on ne peut, de toute façon, pas changer les attributs d'un widget stateless
  final String name;
  final String image;
  final bool checked;
  final Function updateChecked;

  // Constructeur de la classe CityCard
  CityCard({this.name, this.image, this.checked, this.updateChecked});

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
              Ink.image(
                fit: BoxFit.cover,
                image: AssetImage(
                  image,
                ),
                child: InkWell(onTap: () {
                  updateChecked();
                }),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    // Le expanded permet de mettre le texte en bas du Card
                    Expanded(
                      child: Row(
                        // Place l'étoile sur la droite du Card puis en haut du Card
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            checked ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
