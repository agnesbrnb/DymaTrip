import '../../../models/activity_model.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool isSelected;
  final Function toggleActivity;

  ActivityCard({this.activity, this.isSelected, this.toggleActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Largeur à l'infini pour que le container prenne toute la place dispo
      // width: double.infinity,
      margin: EdgeInsets.all(3),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Ink.image(
            fit: BoxFit.cover,
            image: AssetImage(activity.image),
            child: InkWell(onTap: () {
              // Au clic, enregistrer ou supprimer l'activité des favoris
              toggleActivity();
            }),
          ),
          Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (isSelected)
                      Icon(
                        Icons.check,
                        color: Colors.yellow,
                        size: 40,
                      ),
                  ],
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: FittedBox(
                      child: Text(
                        activity.name,
                        style: TextStyle(
                            fontSize: 15, backgroundColor: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
