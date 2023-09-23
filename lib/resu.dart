import 'package:flutter/material.dart';
import 'package:mathquiz/home.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                    (route) => false);
              });
            },
            child: Text('Back To Quiz Page')),
      ),
    );
  }
}
