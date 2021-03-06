import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quiz/api/models.dart';
import 'package:flutter_quiz/widgets/circular_dial.dart';
import 'package:flutter_quiz/widgets/completion_alert.dart';
import 'package:flutter_quiz/widgets/options.dart';
import 'package:http/http.dart' as http;

class Quiz extends StatefulWidget {
  Quiz({this.dataUri});

  final String dataUri;

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    this.getData();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )
    ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            if (answers.length - 1 != currentQuestion) {
              answers.add(null);
            }
            if (currentQuestion < quizData.quizQuestions.length - 1) {
              currentQuestion++;
              return;
            }
            completed = true;
            _showCompletionDialog();
          });
          if (!completed) {
            animationController.reset();
            animationController.forward();
          }
        }
      });
  }

  AnimationController animationController;

  bool loading = true;
  QuizData quizData;
  int currentQuestion = 0;
  double timer = 10;
  bool completed = false;
  List<Answer> answers = [];
  Timer _timer;

  void getData() async {
    final response = await http.get(widget.dataUri);
    final QuizData qData = quizDataFromJson(response.body);
    setState(() {
      loading = false;
      quizData = qData;
    });
    animationController.forward();
  }

  int getCorrectAnswers() {
    return answers.where((element) => element != null && element.isTrue).length;
  }

  Future<void> _showCompletionDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CompletionAlert(
          total: quizData.quizQuestions.length,
          correctAnswers: getCorrectAnswers(),
        );
      },
    );
  }

  void chooseAnswer(Answer answer) {
    setState(() {
      if (answers.length - 1 == currentQuestion) {
        answers[currentQuestion] = answer;
      } else {
        answers.add(answer);
      }
    });
  }

  Answer getSelectedAnswer() {
    if (answers.length - 1 < currentQuestion) {
      return null;
    }
    return answers[currentQuestion];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: !loading
              ? Column(
                  children: <Widget>[
                    AnimatedBuilder(
                        animation: animationController,
                        builder: (BuildContext context, Widget child) {
                          return CircularDial(
                            timer: animationController,
                          );
                        }),
                    // CircularDial(timer: timer),
                    Text(
                      quizData.quizQuestions[currentQuestion].questions,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                        '${currentQuestion + 1} of ${quizData.quizQuestions.length}'),
                    Options(
                      selectedAnswer: getSelectedAnswer(),
                      options: quizData.quizQuestions[currentQuestion].answers,
                      chooseAnswer: chooseAnswer,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
              : Text('Please wait while we load the Quiz.'),
        ),
        padding: EdgeInsets.all(20.0),
      ),
      backgroundColor: Colors.grey[850],
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
