
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Widget reusableList({String title, var leading}) {
//  return InkWell(
//    onTap: (){},
//    child: Row(
//
//      selected: true,
//      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),) ,
//      leading: Container(
//          child: SvgPicture.asset(leading)) ,
//
//    ),
//  );
//}

class ReUse extends StatelessWidget {
  final image;
  final text;
  ReUse({this.text, this.image,});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40.0, top: 20, bottom: 20.0),
      child: Row(

        children: <Widget>[
          SvgPicture.asset(image),
          SizedBox(width: 20.0,),
          Text(text,style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}