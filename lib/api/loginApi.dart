

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ineed_app/model/user.dart';

abstract class AbstractAuth{
  Future<Map<String,dynamic>> login({ email,  password});
  Future<Map<String,dynamic>> getAuthUser({String token});
  Future<Map<String,dynamic>> registerUser({ name,  username, password,   email,  phone});

}


class Auth implements AbstractAuth{
  @override
  Future<Map<String, dynamic >> getAuthUser({String token}) {

    return null;
  }

  @override
  Future<Map<String,dynamic >> login({email, password}) async{
    Map<String, dynamic> result = {};
    final String url = "https://myyneed.herokuapp.com/api/v1/user/login";
    var body = {
      "emailorusername" : email,
      "password" : password
    };

    try{
      var response = await http.post(url, body: body);


      int statusCode = response.statusCode;
      print("status$statusCode");
//      print(jsonDecode(response.body));
      if(statusCode != 200){
        result["message"] = jsonDecode(response.body)["message"];
        result['error'] = true;
      }else{
        if(jsonDecode(response.body)["error"] ==  null){
          if(jsonDecode(response.body)["error"] ==  true){
            result['error'] = true;
          }
        }else{
          result["error"] = false;
          print(jsonDecode(response.body));
          var u = User.fromJson(jsonDecode(response.body));
          print(" this  $u");
          result['user'] = u;
        }
      }





    }catch(error){
      print(error.toString());
    }
    print("papapapa $result");

    return result;

  }

  @override
  Future<Map<String, dynamic >> registerUser({name, username, password, email, phone}) async {
    Map<String, dynamic> result = {};
    final String url = "https://landmark.everythingeasyng.com/api/register";

    var data = {
      "email": email,
      "password": password,
      'name': name,
      'phone':"$phone",
      "password_confirmation" : password
    };

    try{
      var response = await http.post(url, body:data);
      print("data $data");
      print("printntnntnt   ${response.body}");
      int statusCode = response.statusCode;
      if(statusCode != 200){
        result['message'] = jsonDecode(response.body)["error"];
        result['error'] = true;
      }

      else {
        if (jsonDecode(response.body)["error"] == null) {
          if (jsonDecode(response.body)["error"] == true) {
            result["error"] = true;
          } else {
            result["error"] = false;
            var u = User.fromJson(jsonDecode(response.body));
            result['user'] = u;
          }
        }
      }




    }catch(error){
      print(error.toString());
    }


    print("what $result");
    return result;

  }





}