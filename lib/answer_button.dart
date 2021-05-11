import 'package:flutter/material.dart';
import 'package:quizzly/question.dart';

class AnswerButton {
  AnswerButton(
      {Color backgroundColor,
      String answerText,
      List<Question> questions,
      int questionNumber}) {
    Expanded(
      child: MaterialButton(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        onPressed: () {
          setState(() {
            //Add a Tick/Cross depending on if answer is right
            if (questions[questionNumber].questionAnswer == true) {
              answers.add(Icon(
                Icons.check,
                color: Colors.green,
              ));
            } else {
              answers.add(Icon(
                Icons.close,
                color: Colors.red,
              ));
            }
            //Move to the next question on Tap
            nextQuestion();
          });
        },
        child: Text(
          answerText,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
