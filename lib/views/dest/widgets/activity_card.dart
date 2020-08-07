import '../../../models/activity_model.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard({this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Largeur à l'infini pour que le container prenne toute la place dispo
      width: double.infinity,
      margin: EdgeInsets.all(3),
      child: Image.asset(
        activity.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
