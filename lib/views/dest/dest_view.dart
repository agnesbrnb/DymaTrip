import 'package:VoyagApp/views/home/home_view.dart';
import 'package:VoyagApp/widgets/drawer.dart';
import 'package:flutter/material.dart';

import 'package:VoyagApp/models/activity_model.dart';
import 'package:VoyagApp/models/trip_model.dart';
import 'package:VoyagApp/models/city_model.dart';

import 'package:VoyagApp/views/dest/widgets/activity_list.dart';
import 'package:VoyagApp/views/dest/widgets/activity_saved.dart';
import 'package:VoyagApp/views/dest/widgets/trip_overview.dart';

class DestinationView extends StatefulWidget {
  static const String routeName = '/city';
  final City city;
  final Function addTrip;

  DestinationView({this.city, this.addTrip});

  List<Activity> get activities {
    return city.activities;
  }

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
    trip = Trip(city: widget.city.name, activity: [], date: null);
    index = 0;
  }

  // Get the total price of selected activity
  double get amount {
    // Itération sur les activités en gardant la valeur précédente en mémoire entre chaque tour
    return trip.activity.fold(0.0, (prev, a) {
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
  void toggleActivity(Activity activity) {
    // Si l'activité a déjà été enregistrée on la retire, sinon on la sauvegarde
    setState(() {
      trip.activity.contains(activity)
          ? trip.activity.remove(activity)
          : trip.activity.add(activity);
    });
  }

  // Supprime une activité depuis la page Mes Activités
  void deleteActivity(Activity activity) {
    setState(() {
      trip.activity.remove(activity);
    });
  }

  // Sauvegarder un voyage, boite de dialogue
  void saveTrip() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("Sauvegarder ?"),
          contentPadding: const EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, "save");
                  },
                  child: const Text("Oui"),
                  color: Theme.of(context).accentColor,
                ),
                const SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  child: const Text("Nope"),
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
    if (trip.date == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Attention"),
              content: Text("Vous n\'avez pas entré de date"),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    } else if (result == "save") {
      widget.addTrip(trip);
      Navigator.pushNamed(context, HomeView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: const Text("Organiser mon voyage"),
      ),
      drawer: const MyDrawer(),
      body: Container(
        child: widget.showContext(
          context: context,
          children: <Widget>[
            TripOverview(
              cityName: widget.city.name,
              setDate: setDate,
              myTrip: trip,
              amount: amount,
            ),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: widget.activities,
                      selectedActivities: trip.activity,
                      toggleActivity: toggleActivity,
                    )
                  : ActivitySaved(
                      activities: trip.activity,
                      deleteActivity: deleteActivity,
                    ),
            ),
          ],
        ),
      ),
      // Bouton de sauvegarde du voyage
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save_alt),
        onPressed: saveTrip,
      ),

      // Barre de navigation en bas de page
      bottomNavigationBar: BottomNavigationBar(
        // permet d'activer le bouton suivant l'index
        currentIndex: index,
        items: [
          const BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            title: Text("Découvrir"),
          ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.stars),
            title: Text("Mes activités"),
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
