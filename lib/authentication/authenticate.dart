import 'package:flutter/material.dart';
import 'package:new_public_home/authentication/login.dart';
import 'package:new_public_home/authentication/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn=true;
  void toggle(){
    setState(() {
      showSignIn=!showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(!showSignIn){
      return SignIn(toggleView:toggle);
    }
    else{
      return RegisterScreen();
    }
  }
}
