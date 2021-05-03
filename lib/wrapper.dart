import 'package:flutter/material.dart';
import 'package:new_public_home/authentication/authenticate.dart';
import 'package:new_public_home/authentication/register.dart';
import 'package:new_public_home/home_screen/homepage.dart';
import 'package:new_public_home/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<Users>(context);
    print(user);

    if(user==null){
      return IntroScreen();
    }
    else{
      return Authenticate();
      //return HomePage();
    }
  }
}
