import 'package:flutter/material.dart';
import './choice_card.dart';
import './service_choice.dart';

class CarcoraService extends StatelessWidget {
  final Color color;
  CarcoraService(this.color);

  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return Container(
      //color: color,
      decoration: BoxDecoration(
        // Box decoration takes a gradient
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
      child: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 8.0,
        children: List.generate(choices.length, (index) {
          return Center(
            child: ChoiceCard(choice: choices[index]),
          );
        }),
      ),
    );
  }
}
