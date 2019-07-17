import 'package:flutter/material.dart';
import './service_choice.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return SizedBox(
      width: 150.0,
      height: 150.0,
      child: Card(
        // color: choice.color,
        clipBehavior: Clip.hardEdge,
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Container(
          //color: choice.color,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0), color: choice.color
              /*  image: DecorationImage(
            image: ExactAssetImage('assets/nature3.jpg'),
            fit: BoxFit.cover,
          ), */
              ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(choice.icon, size: 50.0, color: textStyle.color),
                Text(
                  choice.title,
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                    fontFamily: "OpenSans",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
