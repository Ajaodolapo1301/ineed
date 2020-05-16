import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ineed_app/constants/colorConstants.dart';
import 'package:ineed_app/model/errand.dart';
import 'package:ineed_app/provider/appState.dart';
import 'package:ineed_app/reuseable/reuse.dart';
import 'package:ineed_app/screen/home.dart';


import 'package:provider/provider.dart';
import 'dart:io';

class AddErrand extends StatefulWidget {
  @override
  _AddErrandState createState() => _AddErrandState();
}

class _AddErrandState extends State<AddErrand> {
  AppState appState;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var items;
  var price;

  TextEditingController destinationController = TextEditingController();
  File imageFile;
//final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white.withOpacity(0.2),
        iconTheme: IconThemeData(
          color: Color(0xffD8D8D8),
        ),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Container(
              width: 200,
              margin: EdgeInsets.only(top: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: kPrimaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "you are currently in ${appState.address == null ? "..." : appState.address}",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
//                              Text("What do you need")
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
//                Text(
//                    "Add items ",
//                    style: TextStyle(
//                        color: kPrimaryColor,
//                        fontWeight: FontWeight.bold,
//                        fontSize: 18)),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
//                                    height: 200,
                                child: TextFormField(
                                    maxLines: 8,
                                    maxLength: 100,
                                    keyboardType: TextInputType.multiline,
//                                                maxLines: null,
                                    decoration: InputDecoration(
//                                        suffixIcon:   Icon(Icons.person),
                                        labelText: 'Add Items for procure',
                                        labelStyle: TextStyle(
                                          fontSize: 20,
                                        ),
                                        border: OutlineInputBorder()),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return ' please enter the item name';
                                      }
                                      items = value;
                                      return null;
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
//                                    height: 200,
                                child: TextFormField(
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
//                                    decoration: InputDecoration(
//                                        suffixIcon:   Icon(Icons.person),
//                                        labelText: 'Email' ,
//                                        labelStyle: TextStyle(fontSize: 20, )
//                                    ),
//                              keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
//                                        suffixIcon:   Icon(Icons.person),
                                        labelText: 'Price',
                                        labelStyle: TextStyle(
                                          fontSize: 20,
                                        ),
                                        border: OutlineInputBorder()),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter price';
                                      }
                                      price = value;
                                      return null;
                                    }),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: showingDialog,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset("images/cam.png"),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: <Widget>[
                          PointsWithColor(
                            colour: Colors.red,
                            margin: EdgeInsets.only(left: 0.0, bottom: 50.0),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Drop off',
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.grey)),
                              Container(
                                width: 200,
                                child: TextField(
                                  controller: destinationController,
                                  onChanged: (value) {
                                    appState.address = value;
                                  },
                                ),
                              ),
                            ],
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 0.0, bottom: 50.0),
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                              alignment: Alignment.topRight,
                            ),
                          ),

//                                      Column(
//                                        children: <Widget>[
//                                          Container(
//                                            width:200,
//                                            child: ListTile(
//                                              title: Text('Drop off',
//                                                  style: TextStyle(
//                                                      fontSize: 13.0, color: Colors.grey)),
//                                              subtitle: TextField(
//                                                controller: destinationController,
//                                                onChanged: (value) {
//                                                 appState.address = value;
//                                                },
//                                              ),
//                                              trailing: IconButton(
//                                                icon: Icon(Icons.add),
//                                                onPressed: () {},
//                                                alignment: Alignment.topRight,
//                                              ),
//                                            ),
//                                          ),
//                                          SizedBox(
//                                            height: 10.0,
//                                          ),
//
//
//
//
//                                        ],
//                                      )
                        ],
                      ),

                      InkWell(
                        onTap: () {
                          if (_formkey.currentState.validate()) {
                            addRequest();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
                          }
                        },
                        child: Center(
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            color: kPrimaryColor,
                            child: Center(
                                child: Text(
                              'Proceed',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ])),

//=====Grid starts here==
      ]),
    );
  }

  showingDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Make a choice"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _opencamera();
                    },
                    child: Text("Take Photo"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _openGallery();
                    },
                    child: Text("Choose existing Photo"),
                  )
                ],
              ),
            ),
          );
        });
  }

  void _opencamera() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = picture;
    });
  }

  void _openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = picture;
    });
  }

  void addRequest() {

    appState.timeline.add(Errand(
      price: price,
      text: items,
      location: "ikeja",
      name: "Ade",
      time: "An hour ago",
    ));

    print(appState.timeline.length);
  }
}

class Product extends StatelessWidget {
  final item;
  final price;

  Product({this.price, this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[Text(item), Text(price)],
      ),
    );
  }
}
