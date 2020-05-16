//
//import 'package:flutter/material.dart';
//import 'package:ineed_app/constants/colorConstants.dart';
//import 'package:ineed_app/provider/appState.dart';
//import 'package:ineed_app/reuseable/reuse.dart';
//import 'package:ineed_app/screen/home.dart';
//import 'package:provider/provider.dart';
//
//class SecondPage extends StatefulWidget {
//  var address;
//  SecondPage({this.address});
//
//  @override
//  _SecondPageState createState() => _SecondPageState();
//}
//
//class _SecondPageState extends State<SecondPage> {
//AppState appState;
//  TextEditingController destinationController = TextEditingController();
//
//
//
//  @override
//  void initState() {
//    destinationController.text = widget.address;
//    super.initState();
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//     appState = Provider.of<AppState>(context);
//    return Scaffold(
//        appBar: AppBar(
//          elevation: 0.0,
//          backgroundColor: Colors.white.withOpacity(1.0),
//          leading: IconButton(
//            icon: Icon(Icons.arrow_back),
//            color: Color(0xff919AA3),
//            onPressed: () {
//              Navigator.pop(context);
//            },
//          ),
//          actions: <Widget>[
//            Container(
//                margin: EdgeInsets.only(top: 14.0, right: 10.0),
//                child: Text(
//                  "Done",
//                  style: TextStyle(
//                      color: Color(0xff919AA3),
//                      fontSize: 18.0,
//                      fontWeight: FontWeight.bold),
//                ))
//          ],
//        ),
//        body: Column(
//
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: Column(
//                    children: <Widget>[
//                      PointsWithColor(
//                        colour: Colors.red,
//                        margin: EdgeInsets.only(left: 20.0, bottom: 10.0),
//                      ),
//
////                      )
//                    ],
//                  ),
//                ),
//                Expanded(
//                  flex: 5,
//                  child: Padding(
//                    padding: const EdgeInsets.only(top: 50.0),
//                    child: Column(
//                      children: <Widget>[
//                        ListTile(
//                          title: Text('Drop off',
//                              style: TextStyle(
//                                  fontSize: 13.0, color: Colors.grey)),
//                          subtitle: TextField(
//                            controller: destinationController,
//                              onChanged: (value) {
//                                widget.address = value;
//                              },
//                               ),
//                          trailing: IconButton(
//                            icon: Icon(Icons.add),
//                            onPressed: () {},
//                            alignment: Alignment.topRight,
//                          ),
//                        ),
//                        SizedBox(
//                          height: 10.0,
//                        ),
////
////                        ListTile(
////                          title: Text(
////                            'Destination',
////                            style:
////                            TextStyle(fontSize: 13.0, color: Colors.grey),
////                          ),
////                          subtitle: TextField(
////                            autofocus: true,
////                            keyboardType: TextInputType.text,
////                            controller: destinationController,
////                            onSubmitted: (value) {
//////                              appState.sendRequestDestination(value);
////                              value = value;
//////                              appState.sendRequestDestination(value);
//////                              Navigator.push(
//////                                  context,
//////                                  MaterialPageRoute(
//////                                      builder: (context) => ThirdScreen(
//////                                        destination: value,
//////                                      )));
////                              print(value);
////                            },
////                          ),
////                          trailing: IconButton(
////                            icon: Icon(Icons.cancel),
////                            onPressed: () {
////                              destinationController.text = "";
////                              print('clicked');
////                            },
////                            alignment: Alignment.topRight,
////                          ),
////                        ),
//
//
//
//                      ],
//                    ),
//                  ),
//                )
//              ],
//            ),
//            InkWell(
//              onTap: (){
//                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
//              },
//              child: Container(
//                width: 100,
//                height: 40,
//                color: kPrimaryColor,
//                child: Center(child: Text('Place',style: TextStyle(color: Colors.white), )),
//              ),
//            )
////            Row(
////              children: <Widget>[
////                buttons(color: Colors.green, image: 'images/surface1.png'),
////                SizedBox(
////                  width: 10.0,
////                ),
////                Text(
////                  'Home',
////                  style: TextStyle(color: Colors.grey, fontSize: 17.0),
////                )
////              ],
////            ),
////            SizedBox(
////              height: 20.0,
////            ),
////            Row(
////              children: <Widget>[
////                buttons(color: Colors.blue, image: 'images/icons-gps.png'),
////                SizedBox(
////                  width: 10.0,
////                ),
////                Text(
////                  'Work',
////                  style: TextStyle(color: Colors.grey, fontSize: 17.0),
////                )
////              ],
////            )
//          ],
//        ));
//  }
//}