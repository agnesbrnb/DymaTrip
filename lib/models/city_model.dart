import 'package:VoyagApp/models/activity_model.dart';
import 'package:flutter/foundation.dart';

class City {
  @required
  String image;
  @required
  String name;
  @required
  List<Activity> activities;
  City({this.image, this.name, this.activities});
}
