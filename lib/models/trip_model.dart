import 'package:VoyagApp/models/activity_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Trip {
  String id;
  String city;
  List<Activity> activity;
  DateTime date;

  Trip({
    @required this.city,
    @required this.activity,
    @required this.date,
  }) : id = UniqueKey().toString();
}
