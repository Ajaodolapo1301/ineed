import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:ineed_app/api/loginApi.dart';
import 'package:ineed_app/model/user.dart';


abstract class AbstractAuthModel{
  Future<Map<String,dynamic>> login({ email,  password});
  Future<Map<String,dynamic>> getAuthUser();
  Future<Map<String,dynamic>> registerUser({ String name,  username,  password,  String email, String phone});

}



class LoginState extends AbstractAuthModel with ChangeNotifier {


  User _user;
  User get  user => _user;
  Box box;


  set user(User value){
    _user = value;
    notifyListeners();
  }

  LoginState(User value){
    box = Hive.box("user");
    if(value != null){
      user = value;
    }
  }

  @override
  Future<Map<String,dynamic >> getAuthUser() {
    // TODO: implement getAuthUser
    return null;
  }

  @override
  Future<Map<String,dynamic >> login({email, password}) async{
    Map<String, dynamic> result = Map();
    try{
      result = await Auth().login(email: email, password: password);
      print("uuuuuuu  ${result["user"]}");
      if(result["error"] == null){
        result['error'] = true;
        result['message'] = 'An Error occured, please  check your internet connection and try again';
      }
    }catch(error){
      print("yyyy ${error.toString()}");
      result['error'] = true;
      result['message'] = error.toString();
    }

    if(result['error'] == false){
      print("Subhanallah");
      box.put('user', result['user']);
      user = result['user'];
    }

    print("loginfrom state $user");

    return result;
  }

  @override
  Future<Map<String,dynamic >> registerUser({ String name,  username,  password, address, String email, String phone}) async{
    Map<String, dynamic> result = Map();

    try{
      result = await Auth().registerUser( name: name, username: password, password: password,email: email,  );
      print(" jsjajsj${result["message"]}");
      if(result["error"] == null){
        result["error"] = true;
        result['message'] ='An Error occured, please  check your internet connection and try again';

      }else{
        if(result["error"] ==  true){
          result["error"] = true;
          result['message'] ='The email has already been taken';
        }
      }


    }catch(error){
      print(error.toString());
      result['error'] = true;
      result['message'] = error.toString();
    }

    if(result['error'] == false ){
      print("alhamdulilah ");
      box.put('user', result['user']);
      user = result['user'];
    }
    print(" register $user");

    print("register $result");
    return result;
  }

}




