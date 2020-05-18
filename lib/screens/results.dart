import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  Results({this.correctAnswers, this.total});

  final int correctAnswers;
  final int total;

  String getAppreciationText() {
    if (correctAnswers == total) {
      return "Awesome!";
    }
    if (correctAnswers == 0) {
      return "Oops!";
    }
    if (correctAnswers < total / 2) {
      return "Not bad!";
    }
    if (correctAnswers > total / 2) {
      return "Good!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text(
      //     'Quiz Results',
      //     style: TextStyle(
      //       color: Colors.grey.shade500,
      //     ),
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              getAppreciationText(),
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: Theme.of(context).textTheme.headline3.fontSize),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "You've got",
                    style: TextStyle(
                      color: Colors.orange[300],
                    ),
                  ),
                  Text(
                    '$correctAnswers / $total',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline3.fontSize,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    'answers correct!',
                    style: TextStyle(
                      color: Colors.orange[300],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.deepOrange, width: 2)),
              height: 200,
              width: 200,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
            ),
            RaisedButton(
              color: Colors.orange,
              elevation: 1,
              child: Text('Done'),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey[850],
    );
  }
}
