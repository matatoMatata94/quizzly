import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Quizzly());

class Quizzly extends StatefulWidget {
  const Quizzly({Key key}) : super(key: key);

  @override
  _QuizzlyState createState() => _QuizzlyState();
}

class _QuizzlyState extends State<Quizzly> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Center(
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'Here appears the text of the Question',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.all(20),
              height: 75,
              minWidth: 200,
              color: Colors.green,
              onPressed: () {},
              child: Text(
                'RIGHT',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
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
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                Icon(
                  Icons.check,
                  color: Colors.green,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
