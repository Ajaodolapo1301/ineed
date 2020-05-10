import 'package:flutter/material.dart';

class PointsWithColor extends StatelessWidget {
  final Color colour;
  final margin;
  PointsWithColor({this.colour, this.margin});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      width: 10.0,
      margin: margin,
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
    );
  }
}

class Points extends StatelessWidget {
  const Points({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 10.0 ),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
//              margin: EdgeInsets.only(left: 100.0),

      height: 5.0,
      width: 5.0,
    );
  }
}



Widget buttons({Color color, String image}) {
  return InkWell(
    onTap: (){},
    child: Container(
        margin: EdgeInsets.only(left: 20.0),
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          color: color,

        ),
        child: Image.asset(image)
    ),
  );
}