import 'package:flutter/material.dart';

class ReusableSingleCard extends StatelessWidget {

  final String name;
  final String time;
  final String location;
  final String text;
  final String typeOfErrand;
  final String price;

  ReusableSingleCard(
      {
        this.name,
        this.time,
        this.location,
        this.text,
        this.typeOfErrand,
        this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(bottom: 50.0, left: 5.0, top: 7.0),
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Image.asset("images/avi.png"),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(left: 5.0, top: 10, right: 10, bottom: 10),
                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.space,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            name,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.0),
                          ),
                        ),
                        Spacer(),
                        Container(

                          child: Text(
                            time,
                            style: TextStyle(color: Colors.black26),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 13.0,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            location,
                            style: TextStyle(color: Colors.black26),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
             Container(
                      child: Text(text),
                    ),

                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              ' NGN $price',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green),
                            )),
//                        Container(
//                          margin: EdgeInsets.only(bottom: 5.0, right: 5.0),
//                          child: Text(
//                            typeOfErrand,
//                            style: TextStyle(color: Colors.black26),
//                          ),
//                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


