import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ineed_app/constants/colorConstants.dart';
import 'package:ineed_app/reuseable/reusableList.dart';
import 'package:ineed_app/screen/account.dart';



class Draw extends StatefulWidget {
  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {

//  AppState appState;
//  LoginState loginState;
//  ModelState modelState;
  @override
  Widget build(BuildContext context) {
//    appState = Provider.of<AppState>(context);
//    modelState = Provider.of<ModelState>(context);
//    loginState = Provider.of<LoginState>(context);
    return Drawer(
      child:  Container(
        color: kPrimaryColor,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[

            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.only(left: 30.0, top: 20),
              color: kPrimaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap:(){
//                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StayOrder()));
                    },
                    child: Container(
                      height:77,
                      width: 77,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      child: Image.asset("images/Shape.png"),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Text("ola",  style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w500),),
                  Text("ola@gmail.com", style: TextStyle(color: Colors.white, fontSize: 16))
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Account()));
              },
              child: ReUse(
                  text: 'Profile',
                  image: 'images/per.svg'
              ),
            ),
            GestureDetector(onTap: (){
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketScreen()));
            },
              child: ReUse(
                  text: 'Your Ticket',
                  image:  'images/ticket.svg'),
            ),


//              GestureDetector(
//
//                onTap: () {
//
////                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Order(
////
////                    )));
//
//
//                },
//                child: Container(
//                  margin: EdgeInsets.only(left: 40.0, top: 20, bottom: 20.0),
//                  child: Row(
//                    children: <Widget>[
//
//                      Stack(
//                        children: <Widget>[
//                          SvgPicture.asset("images/cart.svg"),
//                          if ( appState.cartList.length > 0)
//                            Padding(
//                              padding: const EdgeInsets.only(left: 2.0),
//                              child: CircleAvatar(
//                                radius: 8.0,
//                                backgroundColor: Colors.red,
//                                foregroundColor: Colors.white,
//                                child: Text(
//                                 appState.cartList.length.toString(),
//                                  style: TextStyle(
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: 12.0,
//                                  ),
//                                ),
//                              ),
//                            ),
//                        ],
//                      ),
//
//
//
//                      SizedBox(width: 20.0,),
//                      Text("Your Order",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
//                    ],
//
//                  ),
//                ),
//              ),


//            GestureDetector(
//              onTap: (){
//
//              },
//              child: ReUse(
//                  text: ' Your Order',
//                  image: 'images/cart.svg'),
//            ),
            GestureDetector(
              onTap: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>Account()));

              },
              child: ReUse(
                  text: 'Wallet',
                  image: 'images/wallet.svg'),
            ),
            Divider(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
            InkWell(
              onTap: (){
                _logOut(context);
              },
              child: ReUse(
                  text: 'Logout',
                  image: 'images/logout.svg'),
            ),

          ],
        ),
      ),
    );
  }
  void _logOut(BuildContext context) async{
    final box = Hive.box('user');
    box.put('user',null);
//    Navigator.pop(context);
//    Navigator.pop(context);
//    Navigator.pushAndRemoveUntil(
//        context,
//        MaterialPageRoute(
//            builder: (context) => FrontPage()),
//            (Route<dynamic> route) => false);
//    }
  }
}