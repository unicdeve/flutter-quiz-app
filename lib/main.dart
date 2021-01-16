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

  final questions = const [
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

  void _answerQuestion() {
    if (_questionIndex < questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
    print('Answer selected');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My second app'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'],
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((a) {
                    return Answer(a, _answerQuestion);
                  }).toList(),
                ],
              )
            : Center(
                child: Text(
                  'Done with questions!',
                ),
              ),
      ),
    );
  }
}
