import 'package:flutter/material.dart';
import 'package:new_public_home/authentication/register.dart';
import 'package:new_public_home/home_screen/homepage.dart';
import 'package:new_public_home/services/firebase_authentication.dart';
import 'package:new_public_home/shared_features/shared_feature.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

   SignIn({Key key, this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey= GlobalKey<FormState>();

  String email="";
  String password="";
  String username="";
  String error="";

  bool loading=false;
  //loading?Loader():

  @override
  Widget build(BuildContext context) {
    return loading? Loader(): Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text('Sign In'),
        actions: [
          FlatButton.icon(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterScreen()));
//            widget.toggleView();
          },
            icon: Icon(Icons.person),
            label: Text("Register"),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
            child:


            Form(
                key: _formKey,
                child:  ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value)=>value.isEmpty?
                      "Enter Email" : null,
                      onChanged: (value) {
                        setState(() {
                          email=value;
                        });
                      },
                      decoration: textFormDecoration.copyWith(
                        hintText: "Email",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: textFormDecoration.copyWith(
                        hintText: "Password",
                      ),
                      obscureText: true,
                      validator: (value)=>value.length<6?
                      "Enter Password 6 or more characters" : null,
                      onChanged: (value) {
                        setState(() {
                          password=value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(onPressed: () async{
                      if(_formKey.currentState.validate()){
                        setState(() {
                          loading=true;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                        });
                        print("Valid");
                        dynamic result= await _auth.
                        signInWithEmailPassword(email, password);
                        if(
                        result==null
                        ){
                          setState(() {
                            error="Sign In Failed,Enter valid credentials";
                            loading=false;
                          });
                        };

                      }
                    },
                      elevation: 10,
                      color: Colors.pinkAccent,
                      child: Text("Sign In",style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(error,style: TextStyle(color: Colors.red,
                        fontSize: 14),
                    )
                  ],
                )
            )
        ),
      ),
    );
  }
}

