

import 'dart:convert';

QuizModel quizModelFromJson(String str) => QuizModel.fromJson(json.decode(str));

String quizModelToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
    List<Question>? questions;

    QuizModel({
        this.questions,
    });

    factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        questions: json["questions"] == null ? [] : List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "questions": List<dynamic>.from(questions!.map((x) => x.toJson())),
    };
}

class Question {
    String? question;
    Answers? answers;
    String? questionImageUrl;
    String? correctAnswer;
    int? score;

    Question({
        this.question,
        this.answers,
        this.questionImageUrl,
        this.correctAnswer,
        this.score,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"],
        answers: json["answers"] == null ? null : Answers.fromJson(json["answers"]),
        questionImageUrl: json["questionImageUrl"] ?? null,
        correctAnswer: json["correctAnswer"],
        score: json["score"],
    );

    Map<String, dynamic> toJson() => {
        "question": question,
        "answers": answers!.toJson(),
        "questionImageUrl": questionImageUrl,
        "correctAnswer": correctAnswer,
        "score": score,
    };
}

class Answers {
    String? a;
    String? b;
    String? c;
    String? d;

    Answers({
        this.a,
        this.b,
        this.c,
        this.d,
    });

    factory Answers.fromJson(Map<String, dynamic> json) => Answers(
        a: json["A"],
        b: json["B"],
        c: json["C"],
        d: json["D"],
    );

    Map<String, dynamic> toJson() => {
        "A": a,
        "B": b,
        "C": c,
        "D": d,
    };
}
