import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const textFormDecoration= InputDecoration(
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.purple,
          width: 2,
        )
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.tealAccent,
          width: 2,
        )
    )

);
const headingStyle = TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
  fontSize: 16.0,
);

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent[200],
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.blue[500],
          size: 50,
        ),
      ),
    );
  }
}