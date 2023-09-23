import 'package:flutter/material.dart';

import '../question.dart';

class IndexCard extends StatelessWidget {
    IndexCard({
    Key? key,
    required this.quiz,
    required this.index,
  }) : super(key: key);

  final MathQuiz quiz;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        leading: const Icon(Icons.question_answer),
        trailing: Text(
          "${index + 1} ) ",
          style: const TextStyle(color: Colors.green, fontSize: 15),
        ),
        title: Text(
          quiz.answers[index].toString(),
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
