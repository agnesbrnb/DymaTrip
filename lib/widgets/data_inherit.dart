import 'package:VoyagApp/models/activity_model.dart';
import 'package:flutter/material.dart';

import '../datas/data.dart' as data;

class Data extends InheritedWidget {
  final List<Activity> activities = data.activities;

  Data({Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: Data);
  }
}
