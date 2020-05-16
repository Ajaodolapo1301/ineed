

import 'package:flutter/material.dart';
import 'package:ineed_app/constants/colorConstants.dart';
import 'package:ineed_app/provider/appState.dart';
import 'package:ineed_app/reuseable/timeline.dart';
import 'package:ineed_app/screen/addErrand.dart';
import 'package:ineed_app/screen/detailPage.dart';
import 'package:provider/provider.dart';




class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  AppState appState;
  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("INeed"),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: appState.timeline.length,
            itemBuilder: (BuildContext context, int index) {
              return

                ReusableCard(
                text: appState.timeline[index].text,
                time: appState.timeline[index].time,
                location: appState.timeline[index].location,

                price: appState.timeline[index].price.toString(),
                name: appState.timeline[index].name,

              );
            },
          ),


        ],
      ),
    floatingActionButton: Container(
      height: 70.0,
      width: 70.0,

      child: FittedBox(
        child: FloatingActionButton(
          child: Icon(Icons.add),
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddErrand()));
            }),
      ),
    ),
    );
  }
}

























class ReusableCard extends StatelessWidget {
  final name;
  final text;
  final time;
  final location;
  final price;


  ReusableCard({this.name, this.time, this.text, this.location, this.price});
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailPage(
          name: name,
          location: location,
          price: price,
          text: text,
          time: time,

        )));

      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20, right: 20, left: 20, top: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(

                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          image: DecorationImage(
                            image: AssetImage("images/avi.png"),
                            fit: BoxFit.cover,

                          )
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(name, style: TextStyle(color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.bold),),
                        SizedBox(height: 4,),
                        Text(time,style: TextStyle(color: kFaded, fontSize:13, ) )
                      ],
                    ),

                  ],
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on, size: 15, color: Colors.red,),
                        Text(location, style: TextStyle(color: kFaded, fontSize:13, )),
                      ],
                    ),
                    Text("NGN $price", style: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),)
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Text(text, style: TextStyle(color: Colors.grey[800], fontSize: 15, height: 1.5, ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
//          Container(
//
//            height: 200,
//            decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(10),
//
//                image: DecorationImage(
//                  image: AssetImage("images/landMarkIcon.png"),
//                  fit: BoxFit.contain,
//
//                )
//            ),
//          ),

            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                open(),
//                closed(),

              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
  open() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      decoration: BoxDecoration(color: Colors.green,
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.lock_open,color: Colors.white,),
            SizedBox(width: 5,),
            Text("Open", style: TextStyle(color: Colors.white, fontSize: 15, height: 1.5, ),)
          ],
        ),
      ),
    );
  }
//
//
//
//
//
//
//
//
//
//
//
//
//  closed() {
//    return Container(
//
//      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//      decoration: BoxDecoration(
//        color: Colors.red,
//        border: Border.all(color: Colors.grey[200]),
//        borderRadius: BorderRadius.circular(50),
//      ),
//      child: Center(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Icon(Icons.close, color: Colors.white,),
//            SizedBox(width: 5,),
//            Text("Closed",  style: TextStyle(color: Colors.white, fontSize: 15, height: 1.5, ),)
//          ],
//        ),
//      ),
//    );
//  }
}







//class Try extends StatefulWidget {
//  final userImage;
//  final feedText;
//  final time;
//  final image;
//  Try({this.time, this.image, this.feedText, this.userImage});
//  @override
//  _TryState createState() => _TryState();
//}
//
//class _TryState extends State<Try> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(),
//
//      body: Card(
//        child: Container(
//          margin: EdgeInsets.only(bottom: 20, right: 20, left: 20, top: 20),
//          child: Column(
//            children: <Widget>[
//              Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//            Row(
//
//              children: <Widget>[
//                Container(
//                  width: 50,
//                  height: 50,
//                  decoration: BoxDecoration(
//                    shape: BoxShape.circle,
//
//                    image: DecorationImage(
//                      image: AssetImage("images/avi.png"),
//                      fit: BoxFit.cover,
//
//                    )
//                  ),
//                ),
//                SizedBox(width: 10,),
//                Column(crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text("Ola", style: TextStyle(color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.bold),),
//                    SizedBox(height: 4,),
//                    Text("1 hr ago",style: TextStyle(color: kFaded, fontSize:13, ) )
//                  ],
//                ),
//
//
//              ],
//            ),
//                  IconButton(icon: Icon(Icons.more_horiz),)
//                ],
//              ),
//              SizedBox(height: 20,),
//              Text("Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore hic a deserunt est quod maxime",
//                style: TextStyle(color: Colors.grey[800], fontSize: 15, height: 1.5, ),
//              ),
//              SizedBox(height: 10,),
//              Container(
//
//                height: 200,
//                decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//
//                    image: DecorationImage(
//                      image: AssetImage("images/landMarkIcon.png"),
//                      fit: BoxFit.contain,
//
//                    )
//                ),
//              ),
//
//              SizedBox(height: 5,),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                    open(),
//                  closed(),
//
//                ],
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  open() {
//    return Container(
//      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//      decoration: BoxDecoration(color: Colors.green,
//        border: Border.all(color: Colors.grey[200]),
//          borderRadius: BorderRadius.circular(50),
//      ),
//      child: Center(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Icon(Icons.lock_open,color: Colors.white,),
//            SizedBox(width: 5,),
//             Text("Open", style: TextStyle(color: Colors.white, fontSize: 15, height: 1.5, ),)
//          ],
//        ),
//      ),
//    );
//  }
//
//
//  closed() {
//    return Container(
//
//      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//      decoration: BoxDecoration(
//        color: Colors.red,
//        border: Border.all(color: Colors.grey[200]),
//        borderRadius: BorderRadius.circular(50),
//      ),
//      child: Center(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Icon(Icons.close, color: Colors.white,),
//            SizedBox(width: 5,),
//            Text("Closed",  style: TextStyle(color: Colors.white, fontSize: 15, height: 1.5, ),)
//          ],
//        ),
//      ),
//    );
//  }
//
//
//}
