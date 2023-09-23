import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mathquiz/resu.dart';

class DivisionResult {
  final String question;
  final List<int> answers;
  final int quotient;

  DivisionResult(this.question, this.answers, this.quotient);
}

class MathQuiz extends ChangeNotifier {
  List<DivisionResult> questions = [];
  final int numberOfQuestions = 3;
  late int correctAnswer;
  late int correct;
  late int incorrect;
  late String question;
  late List<int> answers;
  void generateQuestion() {
    final randomAnswers = divideAndGenerateRandomAnswers();
    question = randomAnswers.question;
    answers = randomAnswers.answers;
    correctAnswer = randomAnswers.quotient;
    notifyListeners();
  }

  void reseetQuiz(BuildContext context) {
    correct = 0;
    incorrect = 0;
    notifyListeners();
  }

  DivisionResult divideAndGenerateRandomAnswers() {
    Random random = Random();
    int dividend;
    int divisor;
    int quotient;
    do {
      dividend = random.nextInt(100) + 10;
      divisor = random.nextInt(9) + 4;
      quotient = dividend ~/ divisor;
    } while (dividend % divisor != 0);
    String question = '$dividend divided by $divisor = ..';
    List<int> answers = [quotient];
    while (answers.length < 4) {
      int randomAnswer = quotient + random.nextInt(10) - 5;
      if (!answers.contains(randomAnswer)) {
        answers.add(randomAnswer);
      }
    }
    answers.shuffle();
    notifyListeners();
    return DivisionResult(question, answers, quotient);
  }

  void checkAnswer(BuildContext context) {
    if (correct == 4) {
      reseetQuiz(context);

      gameOver(context);
    }

    if (incorrect == 2) {
      reseetQuiz(context);

      gameOver(context);
    }
    notifyListeners();
  }

  void gameOver(BuildContext context) {
    for (int i = 0; i < numberOfQuestions; i++) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Result(),
        ),
      );
    }
    notifyListeners();
  }

  void getQuestion() {
    generateQuestion();
    notifyListeners();
  }
}





























  // void generateQuestions() {
  //   for (int i = 0; i < numberOfQuestions; i++) {
  //     DivisionResult result = divideAndGenerateRandomAnswers();
  //     questions.add(result);
  //   }
  //   notifyListeners();
  //   // ignore: unused_element
  // }
















// void main() {
//   MathQuiz quiz = MathQuiz();
//   quiz.generateQuestions();

//   for (int i = 0; i < quiz.questions.length; i++) {
//     print('Question ${i + 1}: ${quiz.questions[i].question}');
//     print('Correct Answer: ${quiz.questions[i].quotient}');
//   }
// }



// class DivisionResult {
//   final String question;
//   final List<int> answers;
//   final int quotient;

//   DivisionResult(this.question, this.answers, this.quotient);
// }

// DivisionResult divideAndGenerateRandomAnswers() {
//   Random random = Random();
//   int dividend;
//   int divisor;
//   int quotient;
//   do {
//     dividend = random.nextInt(900) + 10;
//     divisor = random.nextInt(20) + 5;
//     quotient = dividend ~/ divisor;
//   } while (dividend % divisor != 0);
//   String question = '$dividend divided by $divisor = ';
//   List<int> answers = [quotient];
//   while (answers.length < 4) {
//     int randomAnswer = quotient + random.nextInt(10) - 5;
//     if (!answers.contains(randomAnswer)) {
//       answers.add(randomAnswer);
//     }
//   }
//   answers.shuffle();
//   return DivisionResult(question, answers, quotient);
// }
