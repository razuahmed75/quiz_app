import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:quize_app/helpers/api_client.dart';
import 'package:quize_app/utils/hive/hive_helper.dart';
import 'package:quize_app/view/menu_page.dart';

import '../model/quiz_model.dart';
import '../utils/constants.dart';
import '../utils/hive/keys.dart';

class QuestionsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation animation;

  @override
  void onInit() {
    getData();

    super.onInit();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future getData() async {
    await getQuizData();
    currentQuestionIndex = 0;
    currentScore = 0;
    checkingIndex = 0;
    _animationController =
        AnimationController(duration: Duration(seconds: 10), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        if (animation.value * 10.round() == 10) {
          currentQuestionIndex += 1;
          checkingIndex += 1;
          _animationController.reset();
          _animationController.forward();
        }
        update();
      });
    _animationController.forward();
  }

  var isLoading = false.obs;
  List<Question> questionList = <Question>[].obs;

  Future getQuizData() async {
    print("Getting quizData...");
    isLoading.value = true; // SHOW LOADING
    await ApiClient.get(ENDPOINT_URL: AppConstants.quizeUrl).then((data) {
      if (data.statusCode == 200) {
        questionList = [];
        questionList
            .addAll(QuizModel.fromJson(jsonDecode(data.body)).questions!);
        answer = questionList[0];
        print(questionList[0].answers);
        isLoading.value = false; // HIDE LOADING
      } else {
        isLoading.value = false;
        print(data.body);
        questionList = [];
      }
      update();
    });
  }

  int currentQuestionIndex = 0;
  int currentScore = 0;
  int highScore = 0;
  Question? answer;
  int checkingIndex = 0;

  bool isTappedA = false;
  bool isTappedB = false;
  bool isTappedC = false;
  bool isTappedD = false;

  Future<void> answerQuestion(String selectedAnswer) async {
    if (currentQuestionIndex < questionList.length - 1) {
      _animationController.reset();
      // NEXT QUESTION WILL BE DISPLAYED AFTER 2 SECS LATER
      await Future.delayed(Duration(seconds: 2));
      currentQuestionIndex++;
      _animationController.forward();
      // RESET TAPPED VALUE AFTER CHANGING QUIZ INDEX
      resetTappedValue();
      answer = questionList[currentQuestionIndex - 1];

      if (selectedAnswer == answer!.correctAnswer) {
        // SAVE CURRENT SCORE
        currentScore += answer!.score!;

        // SAVE HIGH SCORE INTO THE LOCAL DATABASE
        if (HiveHelp.read(Keys.highScore) == null) {
          HiveHelp.write(Keys.highScore, currentScore);
        } else {
          if (HiveHelp.read(Keys.highScore) < currentScore) {
            HiveHelp.write(Keys.highScore, currentScore);
          }
        }
        print(answer!.correctAnswer);
        print(answer!.score);
      }
    } else {
      // RESET THE CURRENT VALUE AND GO TO THE MAIN MENU PAGE
      currentScore = 0;
      currentQuestionIndex = 0;
      checkingIndex = 0;
      // RESET TAPPED VALUE AFTER CHANGING QUIZ INDEX
      resetTappedValue();
      Get.offAll(() => MenuPage());
    }
    update();
  }

  // CHECK TAPPED VALUE FOR CHANGING THE COLOR OF ANSWER DEPENDING ON CORRECT ANSWER OR NOT
  checkTappedValue(String selectedAnswer) {
    checkingIndex++;
    if (selectedAnswer == "A") {
      isTappedA = true;
      print("A: " + isTappedA.toString());
    }
    if (selectedAnswer == "B") {
      isTappedB = true;
      print("B: " + isTappedB.toString());
    }
    if (selectedAnswer == "C") {
      isTappedC = true;
      print("C: " + isTappedC.toString());
    }
    if (selectedAnswer == "D") {
      isTappedD = true;
      print("D: " + isTappedD.toString());
    }
    update();
  }

  resetTappedValue() {
    isTappedA = false;
    isTappedB = false;
    isTappedC = false;
    isTappedD = false;
    // update();
  }
}
