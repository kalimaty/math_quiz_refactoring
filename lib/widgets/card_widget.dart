import 'package:flutter/material.dart';

import '../question.dart';

class Card_Widget extends StatelessWidget {
  const Card_Widget({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  final MathQuiz quiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        margin: EdgeInsets.all(8),
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              quiz.correct.toString(),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              quiz.incorrect.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
