import 'package:flutter/material.dart';
import 'package:ineed_app/constants/colorConstants.dart';
import 'package:ineed_app/provider/appState.dart';
import 'package:ineed_app/reuseable/timeline.dart';
import 'package:ineed_app/screen/account.dart';
import 'package:ineed_app/screen/addErrand.dart';
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
      appBar: AppBar(
        title: Text("INeed"),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: appState.timeline.length,
            itemBuilder: (BuildContext context, int index) {
              return ReusableSingleCard(
                text: appState.timeline[index]["text"],
                time: appState.timeline[index]["time"],
                location: appState.timeline[index]["location"],
//              typeOfErrand: appState.timeline[index]["typeofErrand"],
                price: appState.timeline[index]["price"],
                name: appState.timeline[index]["name"],
                userPics: appState.timeline[index]["userPics"],
              );
            },
          ),


        ],
      ),
    floatingActionButton: Container(
      height: 70.0,
      width: 70.0,

      child: FittedBox(
        child: FloatingActionButton(
          child: Icon(Icons.add),
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddErrand()));
            }),
      ),
    ),
    );
  }
}