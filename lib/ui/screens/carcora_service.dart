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
      color: color,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(choices.length, (index) {
          return Center(
            child: ChoiceCard(choice: choices[index]),
          );
        }),
      ),
    );
  }
}
