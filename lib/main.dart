import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      if (_questionIndex < 2) {
        _questionIndex = _questionIndex + 1;
      }
    });
    print('Answer selected');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': "What's your favorite color?",
        'answers': ['White', 'Brown', 'Red', 'Yellow']
      },
      {
        'questionText': "What's your favorite animal",
        'answers': ['Cat', 'Dog', 'Rabbit', 'Lion']
      },
      {
        'questionText': "What's your favorite instructor",
        'answers': ['Sanni', 'Ayeni', 'Dele', 'Johnson']
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My second app'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((a) {
              return Answer(a, _answerQuestion);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
