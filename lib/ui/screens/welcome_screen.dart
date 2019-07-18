import 'package:flutter/material.dart';
import 'package:login/ui/widgets/custom_flat_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400],
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 200.0),
              child: Icon(
                Icons.directions_car,
                color: Color.alphaBlend(Color(0xFFFFFF), Color(0xFFFFFFFF)),
                size: 125.0,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
              child: Text(
                "Carcora",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.alphaBlend(Color(0xFFFFFF), Color(0xFFFFFFFF)),
                  decoration: TextDecoration.none,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: "OpenSans",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Welcome to Carcora",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: "OpenSans",
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
              child: CustomFlatButton(
                title: "Sign In",
                fontSize: 22,
                fontWeight: FontWeight.w700,
                textColor: Colors.black54,
                onPressed: () {
                  Navigator.of(context).pushNamed("/signin");
                },
                splashColor: Colors.black12,
                borderColor: Color.fromRGBO(212, 20, 15, 1.0),
                borderWidth: 0,
                color: Color.alphaBlend(Color(0xFFFFFF), Color(0xFFFFFFFF)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
              child: CustomFlatButton(
                title: "Sign Up",
                fontSize: 22,
                fontWeight: FontWeight.w700,
                textColor: Colors.black54,
                onPressed: () {
                  Navigator.of(context).pushNamed("/signup");
                },
                splashColor: Colors.black12,
                borderColor: Colors.black12,
                borderWidth: 2,
                color: Color.alphaBlend(Color(0xFFFFFF), Color(0xFFFFFFFF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
