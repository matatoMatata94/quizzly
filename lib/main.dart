import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzly/question_brain.dart';

void main() => runApp(Quizzly());

class Quizzly extends StatefulWidget {
  const Quizzly({Key key}) : super(key: key);

  @override
  _QuizzlyState createState() => _QuizzlyState();
}

class _QuizzlyState extends State<Quizzly> {
  List<Icon> answers = [];

  QuestionBrain questionBank = QuestionBrain();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
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
                      //Adds a Tick/Cross depending on if answer is right
                      bool correctAnswer = questionBank.getQuestionAnswer();
                      if (correctAnswer == true) {
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
                      setState(() {
                        questionBank.nextQuestion();
                      });
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
                      //Adds a Tick/Cross depending on if answer is right
                      bool correctAnswer = questionBank.getQuestionAnswer();
                      if (correctAnswer == false) {
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
                      setState(() {
                        questionBank.nextQuestion();
                      });
                    },
                    child: Text(
                      'WRONG',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: answers),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
