import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ineed_app/constants/colorConstants.dart';
import 'package:ineed_app/provider/appState.dart';
import 'package:ineed_app/reuseable/drawer.dart';
import 'package:ineed_app/screen/second.dart';
import 'package:provider/provider.dart';
import 'dart:io';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
AppState appState;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  File imageFile;



  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white.withOpacity(0.2),
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: InkWell(
            onTap: () => _scaffoldKey.currentState.openDrawer(),

            child: Container(
                height: 11,
                width: 32,
                child: SvgPicture.asset("images/draw.svg")),
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xffD8D8D8), ),
      ),
      drawer: Draw(),
      body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right: 30),
                              child: SvgPicture.asset('images/bell.svg')),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Container(
                          width: 200,
                          margin: EdgeInsets.only( top: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("welcome, ola ", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 36),),
//                              Text("ola" , style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 36),),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on, color: kPrimaryColor,),
                                  Text("you are currently in ${appState.address == null ? "..." : appState.address }", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 18),),
                                ],
                              ),
//                              Text("What do you need")

                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20.0,),


                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text("Add items to get"),
                            SizedBox(height: 20.0,),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 200,
                                    child: TextField(
//                              keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        decoration: InputDecoration(
//                                        suffixIcon:   Icon(Icons.person),
                                            labelText: 'Items' ,
                                            labelStyle: TextStyle(fontSize: 20, ),
                                            border: OutlineInputBorder()
                                        )
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Container(
                                    height: 200,
                                    child: TextField(
//                                    decoration: InputDecoration(
//                                        suffixIcon:   Icon(Icons.person),
//                                        labelText: 'Email' ,
//                                        labelStyle: TextStyle(fontSize: 20, )
//                                    ),
//                              keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        decoration: InputDecoration(
//                                        suffixIcon:   Icon(Icons.person),
                                            labelText: 'Price' ,
                                            labelStyle: TextStyle(fontSize: 20, ),
                                            border: OutlineInputBorder()
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      IconButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage(
                        address: appState.address,
                      ))) , icon: Icon(Icons.image, color: kPrimaryColor,  ))
                    ]
                )
            ),


//=====Grid starts here==



          ]
      ),


//bottomNavigationBar:BottomNavigationBar(
//      currentIndex: selectedPage,
//      unselectedItemColor: kPrimaryColor.withOpacity(0.5),
//      iconSize: 30.0,
//      onTap: (int index){
//        setState(() {
//          selectedPage = index;
//        });
//      },
//      items: <BottomNavigationBarItem>[
//        BottomNavigationBarItem(
//          icon: Icon(Icons.shopping_basket),
//          title: Text(''),
//        ),
//        BottomNavigationBarItem(
//          icon: Icon(Icons.home),
//          title: Text(''),
//        ),
//        BottomNavigationBarItem(
//          icon: Icon(Icons.person),
//          title: Text(''),
//        ),
//      ],
//
//    ),
    );
  }

//  ShowingDialog() {
//    showDialog(context: context, builder: (context){
//    return AlertDialog(
//    title: Text("Make a choice"),
//      content: SingleChildScrollView(
//        child: ListBody(
//          children: <Widget>[
//            GestureDetector(
//              onTap: (){
//                _opencamera();
//
//              },
//              child: Text("Take Photo"),
//            ),
//
//            SizedBox(height: 10,),
//
//            GestureDetector(
//              onTap: (){
//                _openGallery();
//              },
//              child: Text("Choose existing Photo"),
//            )
//          ],
//        ),
//      ),
//    );
//    } );
//  }
//
//  void _opencamera() async {
//    var picture  = await ImagePicker.pickImage(source: ImageSource.camera);
//    setState(() {
//      imageFile = picture;
//    });
//  }
//
//  void _openGallery() async {
//   var picture  = await ImagePicker.pickImage(source: ImageSource.gallery);
//    setState(() {
//      imageFile = picture;
//    });
//  }
}
