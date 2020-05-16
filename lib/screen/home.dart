import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ineed_app/constants/colorConstants.dart';
import 'package:ineed_app/screen/account.dart';
import 'package:ineed_app/screen/homePage.dart';
import 'package:ineed_app/screen/products.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;


  List<Widget> _screens = [
  Main(),

    ProductPage(),
    Account()
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(

        body: Center(
          child: _screens[_selectedIndex],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: kPrimaryColor,
          height: 75,
          items: <Widget>[

            Icon(Icons.home, size: 30),

            Icon(Icons.account_balance_wallet, size: 30),
            Icon(Icons.perm_contact_calendar, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              print("index$_selectedIndex");
            });
          },
          animationDuration: Duration(milliseconds: 200),
        ),
    );



  }

}








