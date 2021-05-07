import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Quizzly());

class Quizzly extends StatefulWidget {
  const Quizzly({Key key}) : super(key: key);

  @override
  _QuizzlyState createState() => _QuizzlyState();
}

class _QuizzlyState extends State<Quizzly> {
  List<Icon> answers = [];

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
                        'Here appears the text of the Question',
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
                      setState(() {
                        answers.add(Icon(
                          Icons.check,
                          color: Colors.green,
                        ));
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
                    onPressed: () {},
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
