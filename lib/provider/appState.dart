

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ineed_app/model/errand.dart';

class AppState with ChangeNotifier{


  String address;

  getLocation() async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List <Placemark> placemark = await Geolocator().placemarkFromCoordinates(
        position.latitude, position.longitude);

    address =  placemark[0].name ;
    print("address of the addresser $address");
//    print(driverLocation);
    notifyListeners();
  }

  List <Errand>addProduct =[

  ];




  AppState() {
    getLocation();


  }




  List timeline = [

    {
      "name": "Ola",
      "pics" : "images/gool.png",

      "time" : " 2 hours ago",
      "location" : "Lagos",
      "text" : "  ' Dui`s aute irure dolor in reprehenderit in voluptate quis nostrud' ",
        "userPics" : "images/avi.png",
      "price" :  '17000',
    },


  ];

}