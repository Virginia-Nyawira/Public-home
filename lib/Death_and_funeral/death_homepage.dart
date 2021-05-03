import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:new_public_home/shared_features/shared_feature.dart';

File image;
class DeathHomepage extends StatefulWidget {
  @override
  _DeathHomepageState createState() => _DeathHomepageState();
}

class _DeathHomepageState extends State<DeathHomepage> {
  File _image;
  final picker = ImagePicker();

  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      extendBodyBehindAppBar: true,
      body: SafeArea(child:
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    new Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.blueAccent),
                      ),
                      padding: new EdgeInsets.all(5.0),
                      child: image == null
                          ? Center(child: Text('Add Photo of Deceased'))
                          : Image.file(image),
                    ),
                    Divider(),
                    new IconButton(
                        icon: new Icon(Icons.camera_alt),
                        onPressed: getImageCamera),
                    Divider(),
                    new IconButton(
                        icon: new Icon(Icons.image), onPressed: getImageGallery),
                  ],
                ),
                SizedBox(height: 10,),
                Divider(color: Colors.blue[100],),
                Text("Name:"),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Name of deceased",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      )
                  ),
                ),
                SizedBox(height: 10,),
                Divider(color: Colors.blue[100],),
                Text("Tribute:"),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: "Say Something",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      )
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Colors.blue[300],
                        Colors.redAccent,
                        Colors.blue[300],
                      ]),

                    ),
                    child: Center(child: Text("Post",style: headingStyle.copyWith(color: Colors.black),)),
                  ),
                ),

              ],
            )),
          )
        ],

      )
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: GNav(
            backgroundColor: Colors.transparent, // tab button ripple color when pressed
            activeColor: Colors.blue[700], // tab button hover color
            //haptic: true, // haptic feedback
            //tabBorderRadius: 15,
            tabBorder: Border.all(color: Colors.tealAccent[400], width: 1), // tab button border
            tabShadow: [BoxShadow(color: Colors.cyanAccent, blurRadius: 8)], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 900), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey[800], // unselected icon color

            iconSize: 24, // tab button icon size
            tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
            tabs: [
              GButton(
                icon: LineIcons.plus,
                text: 'Add Post',
              ),

              GButton(
                icon: LineIcons.eye,
                text: 'View Post',
              ),

            ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
//              if(_selectedIndex==0){
//
//              }
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),

    );
  }
}
