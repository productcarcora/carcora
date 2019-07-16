import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon, this.color});

  final String title;
  final IconData icon;
  final Color color;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car, color: Colors.white),
  const Choice(
      title: 'Bicycle', icon: Icons.directions_bike, color: Colors.green),
  const Choice(title: 'Boat', icon: Icons.directions_boat, color: Colors.red),
  const Choice(
      title: 'Bus', icon: Icons.directions_bus, color: Colors.lightBlue),
  const Choice(
      title: 'Train', icon: Icons.directions_railway, color: Colors.grey),
  const Choice(title: 'Walk', icon: Icons.directions_walk, color: Colors.white),
  const Choice(title: 'Car', icon: Icons.directions_car, color: Colors.yellow),
  const Choice(title: 'Bicycle', icon: Icons.drafts, color: Colors.brown),
  const Choice(title: 'Boat', icon: Icons.dvr, color: Colors.amber),
  const Choice(title: 'Bus', icon: Icons.copyright, color: Colors.pink),
  const Choice(title: 'Train', icon: Icons.cloud_off, color: Colors.lightGreen)
];
