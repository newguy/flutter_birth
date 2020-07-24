import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp((MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = const [
      {
        'questionText': 'What\'s your Favorite color?',
        'answers': ['Black', 'Red', 'Pink', 'Blue'],
      },
      {
        'questionText': 'What\'s your Favorite animal?',
        'answers': ['Horse', 'Wolf', 'Pig', 'Dog'],
      },
      {
        'questionText': 'What\'s your Favorite City?',
        'answers': ['Houston', 'Sydney', 'Ontario', 'Lagos'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answers) {
              return Answer(_answerQuestion, answers);
            }).toList()
          ],
        ),
      ),
    );
  }
}
