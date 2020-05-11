import 'package:flutter/material.dart';
import 'package:ineed_app/provider/appState.dart';
import 'package:ineed_app/reuseable/timeline.dart';
import 'package:provider/provider.dart';




class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  AppState appState;
  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(),
      body:  ListView.builder(
        itemCount: appState.timeline.length,
        itemBuilder: (BuildContext context, int index) {
          return ReusableSingleCard(
            text: appState.timeline[index]["text"],
            time: appState.timeline[index]["time"],
            location: appState.timeline[index]["location"],
//              typeOfErrand: appState.timeline[index]["typeofErrand"],
            price: appState.timeline[index]["price"],
            name: appState.timeline[index]["name"],
            userPics: appState.timeline[index]["pics"],
          );
        },
      ),
    );
  }
}