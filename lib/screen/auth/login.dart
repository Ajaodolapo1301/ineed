import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ineed_app/constants/colorConstants.dart';
import 'package:ineed_app/provider/loginState.dart';
import 'package:ineed_app/screen/auth/register.dart';
import 'package:ineed_app/screen/home.dart';
import 'package:provider/provider.dart';




class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
var email;
  var password;
  bool isLoading  = false;
  bool hidePassword = true;
LoginState   loginState;




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
    loginState = Provider.of<LoginState>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height/ 9,),
            Container(
              width: 200,
                height: 200,
                child: Image.asset("images/landMarkIcon.png")),
            SizedBox(height: 10,),

            Text("Welcome!", style: TextStyle(color: kPrimaryColor, fontSize: 32, fontWeight: FontWeight.bold),),
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

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        cursorColor: kFaded,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(

                            focusedBorder:UnderlineInputBorder(
                              borderSide:  BorderSide(color: kPrimaryColor, width: 1.0),

                            ),
                            suffixIcon: Icon(Icons.email),
                            labelText: 'Email' ,
                            labelStyle: TextStyle(fontSize: 15, color: kFaded )
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return ' please fill this space';
                          }
                          email = value;

                          return null;
                        }
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      cursorColor: kFaded,
                      keyboardType: TextInputType.text,
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                          focusedBorder:UnderlineInputBorder(
                            borderSide:  BorderSide(color: kPrimaryColor, width: 1.0),

                          ),
                          suffixIcon:   IconButton(icon: hidePassword ? Icon(Icons.remove_red_eye, color: kPrimaryColor,): SvgPicture.asset('images/eye.svg'),onPressed: (){
                            setState(() {
                              hidePassword =! hidePassword;
                            });
                          },
                          ),
                          labelText: 'Password' ,
                          labelStyle: TextStyle(fontSize: 15, color: kFaded )
//                    hintText: 'Full na
//                    hintStyle: (
                      ),
                      validator: (value){
                        if( ( value.isEmpty)){
                          return "password Please";
                        }
                        password = value;
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){

                        if( _formkey.currentState.validate()){
                        _handleLogin();
                        }
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
            SizedBox(height: 20,),
            Column(
              children: <Widget>[
                Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    SizedBox(width: 5.0,),
                    InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                        },
                        child: Text('Register',style: TextStyle(color: kPrimaryColor, fontSize: 14, fontWeight: FontWeight.bold),))
                  ],
                ),
                SizedBox(height: 10,),
                Text("Forgot Password", style: TextStyle(color: kPrimaryColor),)
              ],
            )

          ],
        ),
      ),
    );
  }






  _handleLogin() async{

    setState(() {
      isLoading = true;
    });

    var result = await  loginState.login(email: email, password: password);
    if(result['error'] == true){
      _showMsg(result['message']);

    }else{
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => Home()),
              (Route<dynamic> route) => false);
    }

    setState(() {
      isLoading = false;
    });
  }






  void _touchId() {
  }
}



