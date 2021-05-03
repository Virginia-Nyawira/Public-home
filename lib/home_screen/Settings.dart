import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_public_home/shared_features/shared_feature.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.teal[100],
      child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.purpleAccent[100],
                child: Icon(Icons.add_a_photo),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
              ),

              SizedBox(
                height: 20,
              ),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Bio',
                ),
              ),

              SizedBox(
                height: 80,
              ),
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
                      Colors.teal,
                      Colors.blue[300],
                    ]),

                  ),
                  child: Center(child: Text("Save",style: headingStyle.copyWith(color: Colors.black),)),
                ),
              ),

            ],
        ),
      ),
          )
      ),
    );
  }
}
