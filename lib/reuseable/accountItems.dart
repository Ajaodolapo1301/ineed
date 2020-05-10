
import 'package:flutter/material.dart';
import 'package:ineed_app/constants/colorConstants.dart';
class AccountItems extends StatelessWidget {
  final String  text;
  final Function onpress;
  AccountItems({this.text, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(text, style: TextStyle(fontSize: 18,  fontWeight: FontWeight.w500),),
        IconButton(icon: Icon(Icons.arrow_forward_ios, color: kFaded, size: 20,), onPressed: (){
          // ignore: unnecessary_statements
          onpress;
        },
        ),

      ],
    );
  }
}