import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'What\'s your favorite Color ',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite Animal',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Lion', 'score': 1},
        {'text': 'Snake', 'score': 0},
        {'text': 'Elephent', 'score': 0},
      ],
    },
    {
      'questionText': 'Who\'s your favorite Instructor',
      'answers': [
        {'text': 'Awais', 'score': 1},
        {'text': 'Awais', 'score': 1},
        {'text': 'Awais', 'score': 1},
        {'text': 'Awais', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _toatalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _toatalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _toatalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('hadskaas');
    } else {
      print('Nkwenwq');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_toatalScore, _resetQuiz),
      ),
    );
  }
}
