import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//  runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _question = const [
    {
      'questionText': 'What is your favourite color?',
      'answer': [
        {'text': 'blue', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'purple', 'score': 3},
        {'text': 'green', 'score': 1},
      ]
    },
    {
      'questionText': 'What is your favourite animal?',
      'answer': [
        {'text': 'cat', 'score': 3},
        {'text': 'mouse', 'score': 11},
        {'text': 'frog', 'score': 5},
        {'text': 'ant', 'score': 9},
      ]
    },
    {
      'questionText': 'Who is your favourite male korean actor?',
      'answer': [
        {'text': 'ksh', 'score': 1},
        {'text': 'jcw', 'score': 1},
        {'text': 'psj', 'score': 1},
        {'text': 'lmh', 'score': 1},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _question.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // question = []; // does not work if question is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _question.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                question: _question,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
