import 'dart:convert';

QuizData quizDataFromJson(String str) => QuizData.fromJson(json.decode(str));

String quizDataToJson(QuizData data) => json.encode(data.toJson());

class QuizData {
    String appName;
    String eventConductedBy;
    List<QuizQuestion> quizQuestions;

    QuizData({
        this.appName,
        this.eventConductedBy,
        this.quizQuestions,
    });

    factory QuizData.fromJson(Map<String, dynamic> json) => QuizData(
        appName: json["AppName"],
        eventConductedBy: json["Event Conducted By"],
        quizQuestions: List<QuizQuestion>.from(json["Quiz Questions"].map((x) => QuizQuestion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "AppName": appName,
        "Event Conducted By": eventConductedBy,
        "Quiz Questions": List<dynamic>.from(quizQuestions.map((x) => x.toJson())),
    };
}

class QuizQuestion {
    String questions;
    List<Answer> answers;

    QuizQuestion({
        this.questions,
        this.answers,
    });

    factory QuizQuestion.fromJson(Map<String, dynamic> json) => QuizQuestion(
        questions: json["Questions"],
        answers: List<Answer>.from(json["Answers"].map((x) => Answer.fromJson(x))),
    );

    List<String> getAnswers() {
      return answers.map((e) => e.answers).toList();
    }

    Map<String, dynamic> toJson() => {
        "Questions": questions,
        "Answers": List<dynamic>.from(answers.map((x) => x.toJson())),
    };
}

class Answer {
    String answers;
    bool isTrue;

    Answer({
        this.answers,
        this.isTrue,
    });

    factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        answers: json["Answers"],
        isTrue: json["isTrue"],
    );

    Map<String, dynamic> toJson() => {
        "Answers": answers,
        "isTrue": isTrue,
    };

    @override
  String toString() {
    return '$answers - $isTrue';
  }
}
