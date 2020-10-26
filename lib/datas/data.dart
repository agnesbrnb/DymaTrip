import 'package:VoyagApp/models/activity_model.dart';
import 'package:VoyagApp/models/city_model.dart';
import 'package:VoyagApp/models/trip_model.dart';

List<City> cities = [
  City(
      name: "Parigné Cheval Aventures",
      image: "assets/images/pca.jpg",
      activities: [
        Activity(
          image: "assets/images/activities/chateau.jpg",
          name: "Chateau de la Loire",
          id: "p1",
          city: "Parigné Cheval Aventures",
          price: 700,
        ),
        Activity(
          image: "assets/images/activities/init.jpg",
          name: "Initiation",
          id: "p2",
          city: "Parigné Cheval Aventures",
          price: 200,
        ),
        Activity(
          image: "assets/images/activities/vignes.jpg",
          name: "Vignobles",
          id: "p3",
          city: "Parigné Cheval Aventures",
          price: 525,
        ),
      ]),
  City(name: "DisneyLand", image: "assets/images/disney.jpg", activities: [
    Activity(
      image: "assets/images/activities/btm.jpg",
      name: "Big Thunder Mountain",
      id: "d1",
      city: "DisneyLand",
      price: 0,
    ),
    Activity(
      image: "assets/images/activities/small_world.jpg",
      name: "It's a small world",
      id: "d2",
      city: "DisneyLand",
      price: 0,
    ),
    Activity(
      image: "assets/images/activities/pirates.jpg",
      name: "Pirates of the Caribbean",
      id: "d3",
      city: "DisneyLand",
      price: 0,
    ),
  ]),
  City(name: "FenouilLand", image: "assets/images/fenouil.PNG", activities: [
    Activity(
      image: "assets/images/activities/gratin.jpg",
      name: "Gratin",
      id: "f1",
      city: "FenouilLand",
      price: 8.2,
    ),
    Activity(
      image: "assets/images/activities/pizza.jpg",
      name: "Pizza",
      id: "f2",
      city: "FenouilLand",
      price: 15.3,
    ),
    Activity(
      image: "assets/images/activities/tajine.jpg",
      name: "Tajine",
      id: "f3",
      city: "FenouilLand",
      price: 26.4,
    ),
  ]),
];

List<Trip> trips = [
  Trip(
    city: "Parigné Cheval Aventures",
    date: DateTime.now().add(Duration(days: 2)),
    activity: [
      Activity(
        image: "assets/images/activities/chateau.jpg",
        name: "Chateau de la Loire",
        id: "p1",
        city: "Parigné Cheval Aventures",
        price: 700,
      ),
      Activity(
        image: "assets/images/activities/init.jpg",
        name: "Initiation",
        id: "p2",
        city: "Parigné Cheval Aventures",
        price: 200,
      ),
      Activity(
        image: "assets/images/activities/vignes.jpg",
        name: "Vignobles",
        id: "p3",
        city: "Parigné Cheval Aventures",
        price: 525,
      ),
    ],
  )
];
