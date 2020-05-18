import 'package:flutter/material.dart';
import 'package:flutter_quiz/effects/neumorphic_bs.dart';
import 'package:flutter_quiz/screens/quiz.dart';

class Home extends StatelessWidget {
  static const QUIZ_DATA_URI =
      'http://www.mocky.io/v2/5ebd2f5f31000018005b117f';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Welcome',
            style: TextStyle(color: Colors.grey.shade500),
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            child: Material(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Quiz(
                          dataUri: QUIZ_DATA_URI,
                        );
                      },
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    'START QUIZ',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline5.fontSize,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
            ),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              boxShadow: nueMorphicBoxShadows,
              border: Border.all(color: Colors.deepOrange, width: 2),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[850],
    );
  }
}
