import 'package:flutter/material.dart';
import 'package:flutter_quiz/decorations/concave_decoration.dart';
import 'package:flutter_quiz/effects/neumorphic_bs.dart';
import 'package:flutter_quiz/widgets/progress.dart';

class CircularDial extends StatelessWidget {
  CircularDial({this.timer});

  final Animation<double> timer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InsetCircle(
            percentage: timer.value * 100,
          ),
        ),
      ),
      width: 210,
      height: 210,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(105),
        boxShadow: nueMorphicBoxShadows,
      ),
    );
  }
}

class InsetCircle extends StatelessWidget {
  const InsetCircle({Key key, this.percentage}) : super(key: key);

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: new CustomPaint(
          foregroundPainter: new Progress(
            lineColor: Colors.transparent,
            completeColor: Colors.blueAccent,
            completePercent: percentage,
            width: 10.0,
          ),
          child: Center(
            child: NotchCircle(
              text: '${10 - (percentage ~/ 10)}',
            ),
          ),
        ),
      ),
      decoration: ConcaveDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(190),
        ),
        colors: [
          Colors.grey.shade800,
          Colors.black,
        ],
        depth: 10,
      ),
      height: 190,
      width: 190,
    );
  }
}

class NotchCircle extends StatelessWidget {
  const NotchCircle({
    Key key,
    this.text,
  }) : super(key: key);

  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.orange,
            fontSize: Theme.of(context).textTheme.headline3.fontSize,
          )
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[850],
        boxShadow: nueMorphicBoxShadows,
      ),
      height: 150,
      width: 150,
    );
  }
}
