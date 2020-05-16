

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ineed_app/model/comment.dart';
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




  List<Errand> timeline = [
      Errand(
        name: "Ola",
        text: "Ten bags of rice",
        price: 3000,
        time: " 2 hours ago",
        location: "Abuja"

      )



  ];



  List <Comment>comment = [
    Comment(
      name: "Ade", text: "ill collect 1 mill"
    ),
    Comment(
        name: "Ade", text: "ill collect 1 mill"
    )
  ];

}