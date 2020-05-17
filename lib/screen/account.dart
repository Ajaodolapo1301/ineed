
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ineed_app/constants/colorConstants.dart';
import 'package:ineed_app/provider/appState.dart';
import 'package:ineed_app/provider/loginState.dart';
import 'package:ineed_app/reuseable/accountItems.dart';
import 'package:ineed_app/screen/auth/login.dart';
import 'package:provider/provider.dart';



class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  LoginState loginState;
AppState appState;
  @override
  Widget build(BuildContext context) {
    loginState = Provider.of<LoginState>(context);
    appState = Provider.of<AppState>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.3,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0, top: 18),
              child: InkWell(
                  onTap: (){
//
                  },
                  child: Text('Edit', style: TextStyle(color: Colors.black, fontSize: 16),)),
            )
          ],
          actionsIconTheme: IconThemeData(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,

        ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
SizedBox(height: 20.0,),
              Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: kFaded,
                      radius: 60,
                    ),
                    SizedBox(height: 10.0,),
                    Text(  loginState.user.name , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    Text( appState.address != null ?appState.address: "UnKnown" , style: TextStyle(fontSize: 20, color: kFaded, fontWeight: FontWeight.w500),),
                  ],
                ),
              ),

              SizedBox(height: 20.0,),
          AccountItems(
            text: "Payment Method",
            onpress: null,
          ),
            Divider(thickness: 2.0,),
              AccountItems(
                text: "Invite Friends",
                onpress: null,
              ),
              Divider(thickness: 2.0,),
              AccountItems(
                text: "Settings",
                onpress: null,
              ),
              Divider(thickness: 2.0,),
              InkWell(
                onTap: (){
                  _logOut(context);
                },
                child: AccountItems(
                  text: "Logout",

                ),
              ),
              Divider(thickness: 2.0,),
            ],
          ),
        ),
      ),
    );
  }
  void _logOut(BuildContext context) async{
    final box = Hive.box('user');
    box.put('user',null);
//    Navigator.pop(context);
//    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false);
//    }
  }

}


