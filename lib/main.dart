import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzly/question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzly());

class Quizzly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> answers = [];

  QuestionBrain questionBank = QuestionBrain();

  void checkAnswer(bool chosenAnswer) {
    setState(() {
      if (questionBank.isFinished()) {
        print('Alert');
        Alert(
            context: context,
            type: AlertType.success,
            title: 'FINISHED!',
            desc: 'You finished the quiz',
            buttons: [
              DialogButton(
                child: Text('Restart'),
                width: 120,
                onPressed: () {
                  Navigator.pop(context);
                  questionBank.reset();
                  answers = [];
                },
              )
            ]).show();
      } else {
        //Adds a Tick/Cross depending on if answer is right
        bool correctAnswer = questionBank.getQuestionAnswer();
        if (correctAnswer == chosenAnswer) {
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
        questionBank.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                questionBank.getQuestionText(),
                style: TextStyle(color: Colors.white, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: MaterialButton(
            padding: EdgeInsets.all(20),
            // height: 75,
            // minWidth: 200,
            color: Colors.green,
            onPressed: () {
              checkAnswer(true);
            },
            child: Text(
              'RIGHT',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: MaterialButton(
            padding: EdgeInsets.all(20),
            height: 75,
            minWidth: 200,
            color: Colors.red,
            onPressed: () {
              checkAnswer(false);
            },
            child: Text(
              'WRONG',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 10,
          child: Row(children: answers),
        ),
      ],
    );
  }
}
