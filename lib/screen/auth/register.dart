import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ineed_app/screen/home.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:provider/provider.dart';



import '../../Constants/colorConstants.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {



  bool hidePassword = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  String name;
  var email;
  String username;
  var password;
  var address;
  var phone;


  void _showMsg(body) {
    final snackBar = SnackBar(
      content: Text(body),
      action: SnackBarAction(
        label: "Close",
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Register", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


//              Container(
//                  width: 200,
//                  height: 200,
//                  child: Image.asset("images/landMarkIcon.png")),


//              Text("Welcome!", style: TextStyle(color: kPrimaryColor, fontSize: 32, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                child: Column(

                  children: <Widget>[
                    Text(' " ', style: kTitleStyle,),
                    Text("Regularly and thoroughly clean your hands ", style: kTitleStyle,),
                    Text(" with an alcohol-based hand rub or wash them.", style: kTitleStyle,) ,
                    Text(" Maintain at least 1 metre (3 feet) distance ,", style: kTitleStyle,),
                    Text(" Stay safe.", style: kTitleStyle,),
                    SizedBox(height: 10,),
                    Text('"', style: kTitleStyle,),
                    Text("WHO", style: kTitleStyle,)
                  ],
                ),
              ),

              SizedBox(height: 10.0,),
              Card(

                elevation: 3.0,
                child:    Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
//                   SizedBox(height: 20.0,),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                          autofocus: true,

                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffF2F2F2)
                                ),
                              ),
//
                              labelText: ' name',
                              labelStyle: TextStyle(fontSize: 15,)
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return ' This field can not be empty';
                            }
                            name = value;
                            return null;
                          }
                      ),
                    ),
                    SizedBox(height:30.0,),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffF2F2F2)
                                ),
                              ),
//
                              labelText: 'Username',
                              labelStyle: TextStyle(fontSize: 15,)
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return ' This field can not be empty';
                            }
                            username = value;
                            return null;
                          }
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffF2F2F2)
                                ),
                              ),
//                    suffixIcon:   Icon(Icons.person),
                              labelText: 'email',
                              labelStyle: TextStyle(fontSize: 15,)
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return ' This field can not be empty';
                            }
                            email = value;
                            return null;
                          }
                      ),
                    ),
                    SizedBox(height: 30.0,),


                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          phone = number.phoneNumber;
//                        print(phone);
                        },
                        isEnabled: true,
                        autoValidate: true,
                        formatInput: true,
                      ),
                    ),




                    SizedBox(height: 30.0,),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(

                        keyboardType: TextInputType.text,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffF2F2F2)
                              ),
                            ),
                            suffixIcon: IconButton(icon: hidePassword ? Icon(
                                Icons.remove_red_eye) : SvgPicture.asset(
                                'images/eye.svg'), onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(fontSize: 15,)
//                    hintText: 'Full na
//                    hintStyle: (
                        ),
                        validator: (value) {
                          if (!(value.length > 5 && value.isNotEmpty)) {
                            return "password should contain more than 5 characters";
                          }
                          password = value;
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10.0,),
                  ],
                ),
              ),),
              SizedBox(height: 30.0,),
              Column(
                children: <Widget>[
                  Container(
                      child: Text(
                        'By continuing, I confirm that i have read & agree to the',
                        style: TextStyle(fontSize: 11, color: kFaded),)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                          onTap: () {

                          },
                          child: Text('Terms and Conditions', style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold),)),
                      SizedBox(width: 5.0,),
                      Text('and'),
                      SizedBox(width: 5.0,),
                      InkWell(
                          onTap: () {},
                          child: Text('Privacy policy', style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)))
                    ],
                  )
                ],
              ),
              SizedBox(height: 30.0,),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
//                        if( _formkey.currentState.validate()){
//                        _handleLogin();
//                        }
                },
                child: Container(
                  height: 46,
                  width: 335,
                  child: Material(
                    elevation: 0.0,
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                    child: Center(child: Text( isLoading ? "Processing..." : "Sign in",style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }








//  _handleRegister() async{
//    setState(() {
//      isLoading = true;
//    });
//
//    var result = await loginState.registerUser(
//        fname: fname,
//        lname: lname,
//        email: email,
//        phone: phone,
//        password: password,
//        address: address
//    );
//    if(result['error'] == true){
//      _showMsg( result["message"]);
//    }else{
//      Navigator.pushAndRemoveUntil(
//          context,
//          MaterialPageRoute(
//              builder: (context) => Home()),
//              (Route<dynamic> route) => false);
//    }
//
//    setState(() {
//      isLoading = false;
//    });
//  }
//
//  void _register() async {
//    setState(() {
//      isLoading = true;
//    });
//
//
//    var data = {
//      "email": email,
//      "password": password,
//      'fname': fname,
//      'lname': lname,
//      'address': address,
//      'phone': phone,
//    };
//
//
//    var res = await Network().authData(data, '/api/driver/register');
//    var status = jsonDecode(res.statusCode.toString());
//    var body = jsonDecode(res.body);
//    if (status == 200) {
//      SharedPreferences preferences = await SharedPreferences.getInstance();
//      preferences.setString('token', json.encode(body['access_token']));
//      preferences.setString('driver', json.encode(body['driver']));
//      Navigator.pushAndRemoveUntil(
//          context,
//          MaterialPageRoute(
//              builder: (context) => Home()),
//              (Route<dynamic> route) => false);
//    }
//    setState(() {
//      isLoading = false;
//    });
//  }

//  void getPhoneNumber(String phoneNumber) async {
//    PhoneNumber number =
//    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber);
//
////    print(parsableNumber);
//  }
}