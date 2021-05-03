import 'package:flutter/material.dart';
import 'package:new_public_home/Death_and_funeral/death_homepage.dart';
import 'package:new_public_home/home_screen/Settings.dart';
import 'package:new_public_home/services/firebase_authentication.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.yellow, Color(0xffffccbc)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 100.0, 50.0));

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],

      body: Container(
        //height: 700,
        height:  MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 1.0,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.orange[100], Colors.green],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Public Home",
                        style: TextStyle(
                          letterSpacing: 4.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        )),
                    SizedBox(
                      height: 12,
                    ),
                    Text("'Occasions Invite or Notify Online'",
                        style: TextStyle(
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 175,
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )),
              ),
            ),
            Positioned(
              ///*****************8*****************************To Funeral announcement
                top: 210,
                left: 0.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DeathHomepage()));
                  },
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.amber,
                          Colors.orange[100],
                          Colors.amber
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Death and Funeral Announcement",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                )),

            Positioned(
              ///******************************************To Others************************************************
                top: 280,
                left: 0.0,
                right: 0.0,
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.amber,
                          Colors.orange[100],
                          Colors.amber
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                        child: Text(
                          "Others..",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                  onTap: (){
//                    Navigator.of(context,rootNavigator: true)
//                        .push(MaterialPageRoute(builder:
//                        (context)=> OtherPostOption()));

//                    var alert = AlertDialog(
//                      content: Container(
//                        height: 200,
//                        width: 200,
//                        decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.only(
//                              topLeft: Radius.circular(30),
//                              topRight: Radius.circular(30),
//                            )),
//                        child: Column(
//                          ///*****************************************************Home Country**********************************
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: [
//                            IconButton(
//                                icon: Icon(
//                                  Icons.clear,
//                                  color: Colors.red,
//                                  size: 25,
//                                ),
//                                onPressed: () {
//                                  Navigator.of(context,rootNavigator: true).pop();
//                                }),
//                            FlatButton(
//                                onPressed: () {///**************************************OPTIONS****************************************
//
//                                },
//                                color: Colors.blueGrey,
//                                child: Text("Home Country")),
////********************************************************************************************International*****************************
//                            FlatButton(
//                                onPressed: () {},
//                                color: Colors.blueGrey,
//                                child: Text("International")),
//                          ],
//                        ),
//                      ),
//                    );
//                    showDialog(
//                        context: context,
//                        builder: (BuildContext context) {
//                          return alert;
//                        });


                  },
                )),
            Positioned(
              ///*******************************************************To AFTER EVENT***************************
                top: 350,
                left: 0.0,
                right: 0.0,
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.amber,
                          Colors.orange[100],
                          Colors.amber
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "After Event",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                  onTap: () {
                    var alert = AlertDialog(
                      content: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: Column(
                          //*****************************************************Home Country**********************************
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                  size: 25,
                                ),
                                onPressed: () {
                                  Navigator.of(context,rootNavigator: true).pop();
                                }),
                            FlatButton(
                                onPressed: () {///**************************************OPTIONS****************************************
//                                  Navigator.of(context,rootNavigator: true)
//                                      .push(MaterialPageRoute(builder:
//                                      (context)=>OtherEventOptions()));

                                },
                                color: Colors.blueGrey,
                                child: Text("Home Country")),
//********************************************************************************************International*****************************
                            FlatButton(
                                onPressed: () {},
                                color: Colors.blueGrey,
                                child: Text("International")),
                          ],
                        ),
                      ),
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        });
                  },
                )),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton.icon(
                          onPressed: () async {
                            await _auth.signOuti();
                          },
                          //color: Colors.white,
                          icon:Icon(Icons.person,size: 20,),
                          label: Text("Log Out",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),)
                      ),
                      FlatButton.icon(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SettingsPage()));
                          },
                          color: Colors.transparent,
                          icon:Icon(Icons.settings,size: 20,color: Colors.black,),
                          label: Text("Settings",style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),)
                      ),
//                      IconButton(
//                          icon: Icon(Icons.settings_applications,color: Colors.green[500],size: 50.0,),
//                          onPressed: (){
//                            //Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=>CreateAccount()));
//                          }),
                    ],
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
