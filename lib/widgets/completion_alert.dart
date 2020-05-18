import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/results.dart';

class CompletionAlert extends StatelessWidget {
  CompletionAlert({this.correctAnswers, this.total});

  final correctAnswers;
  final total;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('You have completed the Quiz.'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              'Lets see the results!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
            Center(
              child: RaisedButton(
                elevation: 5,
                color: Colors.orange,
                child: Text('View Results'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Results(
                        correctAnswers: correctAnswers,
                        total: total,
                      );
                    }, settings: RouteSettings(name: '/results')),
                  );
                },
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey[850],
    );
  }
}
