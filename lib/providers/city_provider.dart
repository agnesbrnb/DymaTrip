import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'package:VoyagApp/datas/data.dart' as data;
import 'package:VoyagApp/models/city_model.dart';

class CityProvider with ChangeNotifier {
  final List<City> _cities = data.cities;

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  City getCityByName(String cityName) =>
      cities.firstWhere((city) => city.name == cityName);
}
