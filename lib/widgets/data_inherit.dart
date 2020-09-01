import 'package:VoyagApp/models/city_model.dart';
import 'package:flutter/material.dart';

import '../datas/data.dart' as data;

class Data extends InheritedWidget {
  final List<City> activities = data.cities;

  Data({Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: Data);
  }
}
