
import 'package:flutter/material.dart';
import 'package:ineed_app/constants/colorConstants.dart';
import 'package:ineed_app/reuseable/accountItems.dart';



class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.3,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0, top: 18),
              child: InkWell(
                  onTap: (){
//                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                  },
                  child: Text('Edit', style: TextStyle(color: Colors.black, fontSize: 16),)),
            )
          ],
          actionsIconTheme: IconThemeData(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,

        ),


      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                  Text('Jenny Limar', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  Text('Lagos', style: TextStyle(fontSize: 20, color: kFaded, fontWeight: FontWeight.w500),),
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
            AccountItems(
              text: "Logout",
              onpress: (){

              }
            ),
            Divider(thickness: 2.0,),
          ],
        ),
      ),
    );
  }


}


