import 'package:flutter/material.dart';
import 'package:second_app/answer.dart';
import 'package:second_app/question.dart';

class Quiz extends StatelessWidget {
  final List questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(this.questions, this.questionIndex, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<String>).map((a) {
          return Answer(a, answerQuestion);
        }).toList(),
      ],
    );
  }
}
