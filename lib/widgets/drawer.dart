import 'package:VoyagApp/views/home/home_view.dart';
import 'package:VoyagApp/views/trips/trips_view.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              "Salut",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.5)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Accueil"),
            onTap: () {
              Navigator.pushNamed(context, HomeView.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff),
            title: Text("Mes voyages"),
            onTap: () {
              Navigator.pushNamed(context, TripsView.routeName);
            },
          )
        ],
      ),
    );
  }
}
