

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

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





  AppState() {
    getLocation();


  }
}