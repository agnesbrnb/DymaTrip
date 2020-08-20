import 'package:VoyagApp/views/home/home_view.dart';
import 'package:VoyagApp/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:VoyagApp/datas/data.dart' as list_act;

import 'package:VoyagApp/models/activity_model.dart';
import 'package:VoyagApp/models/trip_model.dart';
import 'package:VoyagApp/models/city_model.dart';

import 'package:VoyagApp/views/dest/widgets/activity_list.dart';
import 'package:VoyagApp/views/dest/widgets/activity_saved.dart';
import 'package:VoyagApp/views/dest/widgets/trip_overview.dart';

class DestinationView extends StatefulWidget {
  static String routeName = '/city';

  // Liste d'activité à faire dans la ville issue d'un modèle
  final List<Activity> activities = list_act.activities;
  // final City city;

  // DestinationView({this.city});

  // Adapt the ui to the device orientation
  showContext({BuildContext context, List<Widget> children}) {
    var orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      return Row(
        children: children,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      );
    } else {
      return Column(
        children: children,
      );
    }
  }

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView>
    with WidgetsBindingObserver {
  Trip trip;
  int index;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    trip = Trip(city: "DisneyLand", idActivities: [], date: null);
    index = 0;
  }

  // Get the selected activities
  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => trip.idActivities.contains(activity.id))
        .toList();
  }

  // Get the total price of selected activity
  double get amount {
    // Itération sur les activités en gardant la valeur précédente en mémoire entre chaque tour
    return trip.idActivities.fold(0.0, (prev, index) {
      var a = widget.activities.firstWhere((a) => a.id == index);
      return prev + a.price;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
  }

  // Remove observer when closing
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  void setDate() {
    // Date Picker qui commence le lendemain et fini un an après la date du jour
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((newDate) {
      // Si une nouvelle date est séléctionnée, attribuer à l'attribut myTrip
      if (newDate != null) {
        setState(() {
          trip.date = newDate;
        });
      }
    });
  }

  // Rechargé l'ui quand l'index change donc au clique sur la bottombar
  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  // Selectionner/Déselectionner une activité depuis la page Découvrir
  void toggleActivity(String id) {
    // Si l'activité a déjà été enregistrée on la retire, sinon on la sauvegarde
    setState(() {
      trip.idActivities.contains(id)
          ? trip.idActivities.remove(id)
          : trip.idActivities.add(id);
    });
  }

  // Supprime une activité depuis la page Mes Activités
  void deleteActivity(String id) {
    setState(() {
      trip.idActivities.remove(id);
    });
  }

  // Sauvegarder un voyage
  void saveTrip() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Sauvegarder ?"),
          contentPadding: EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, "save");
                  },
                  child: Text("Oui"),
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  child: Text("Nope"),
                  onPressed: () {
                    Navigator.pop(context, "no");
                  },
                )
              ],
            )
          ],
        );
      },
    );
    print(result);
    Navigator.pushNamed(context, HomeView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final City city = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: Text("Organiser mon voyage"),
      ),
      drawer: MyDrawer(),
      body: Container(
        child: widget.showContext(
          context: context,
          children: <Widget>[
            TripOverview(
              cityName: city.name,
              setDate: setDate,
              myTrip: trip,
              amount: amount,
            ),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: widget.activities,
                      selectedActivities: trip.idActivities,
                      toggleActivity: toggleActivity,
                    )
                  : ActivitySaved(
                      activities: tripActivities,
                      deleteActivity: deleteActivity,
                    ),
            ),
          ],
        ),
      ),
      // Bouton de sauvegarde du voyage
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_alt),
        onPressed: saveTrip,
      ),

      // Barre de navigation en bas de page
      bottomNavigationBar: BottomNavigationBar(
        // permet d'activer le bouton suivant l'index
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.map), title: Text("Découvrir")),
          BottomNavigationBarItem(
              icon: Icon(Icons.stars), title: Text("Mes activités")),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
