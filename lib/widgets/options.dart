import 'package:flutter/material.dart';
import 'package:flutter_quiz/api/models.dart';
import 'package:flutter_quiz/effects/neumorphic_bs.dart';

class Option extends StatelessWidget {
  Option({this.option, this.onSelect, this.selected});

  final String option;
  final Function onSelect;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
          child: Ink(
            child: InkWell(
              child: Center(
                child: Text(option, style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              onTap: onSelect,
              borderRadius: BorderRadius.circular(25),
            ),
            decoration: BoxDecoration(
              gradient: selected ? LinearGradient(colors: [Colors.orange, Colors.red]): null,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey[850],
      ),
      height: 45,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: nueMorphicBoxShadows,
      ),
    );
  }
}

class Options extends StatelessWidget {
  Options({this.options, this.chooseAnswer, this.selectedAnswer});

  final Answer selectedAnswer;
  final List<Answer> options;
  final Function chooseAnswer;

  bool isSelected(Answer answer) {
    if (selectedAnswer != null) {
      return selectedAnswer == answer;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: options
            .map(
              (option) => Option(
                selected: isSelected(option),
                option: option.answers,
                onSelect: () {
                  chooseAnswer(option);
                },
              ),
            )
            .toList(),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      height: 250,
    );
  }
}
