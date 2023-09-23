import 'package:flutter/material.dart';
import 'package:mathquiz/widgets/indexCard.dart';

import 'question.dart';
import 'widgets/card_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MathQuiz quiz = MathQuiz();

  @override
  void initState() {
    quiz.reseetQuiz(context);
    quiz.generateQuestion();
    quiz.getQuestion();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Math question'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card_Widget(quiz: quiz),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                    elevation: 12,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(quiz.question,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    )),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: IndexCard(quiz: quiz, index: index),
                        onTap: () {
                          if (quiz.answers[index] == quiz.correctAnswer) {
                            quiz.correct++;
                            quiz.getQuestion();
                            quiz.checkAnswer(context);
                          } else {
                            quiz.incorrect++;
                            quiz.getQuestion();
                            quiz.checkAnswer(context);
                          }
                          setState(() {});
                          // ignore: unrelated_type_equality_checks
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}














// floatingActionButton: FloatingActionButton(
      //   onPressed: getQuestion,
      //   tooltip: 'Next',
      //   child: const Icon(Icons.arrow_circle_right_rounded),
      // ),
















 // void reseetQuiz() {
  //   correct = 0;
  //   incorrect = 0;
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const Result(),
  //     ),
  //   );
  // }

//   void _showDialog(
//       {required BuildContext context,
//       required String message,
//       required String content}) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(message),
//           content: Text(content),
//           actions: <Widget>[
//             ElevatedButton(
//               child: Text("OK"),
//               onPressed: () {
//                 Future.delayed(const Duration(milliseconds: 600), () {
//                   getQuestion(); // Prints after 1 second.
//                 });
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

