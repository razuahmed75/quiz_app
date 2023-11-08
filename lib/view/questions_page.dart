import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/config/dimensions.dart';
import 'package:quiz_app/config/spacing.dart';
import 'package:quiz_app/controller/questions_controller.dart';
import 'package:quiz_app/helpers/loader.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';
import '../widgets/progress_bar.dart';
import '../widgets/question_card.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg2.jpg'), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GetBuilder<QuestionsController>(
            init: QuestionsController(),
            builder: (controller) {
              return Obx(
                () => controller.isLoading.value
                    ? Helpers.AppLoader()
                    : controller.questionList.isEmpty
                        ? SizedBox()
                        : Padding(
                            padding: Dimensions.kAppPadding,
                            child: Column(
                              children: [
                                VSpace(20.h),
                                ProgressBar(),
                                VSpace(10.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Total Questions: ${controller.currentQuestionIndex + 1}/${controller.questionList.length}",
                                        style: Styles.baseStyle),
                                    Text(
                                        "Current Score: ${controller.currentScore}",
                                        style: Styles.baseStyle),
                                  ],
                                ),
                                VSpace(20.h),
                                QuestionCard(
                                  text: controller
                                          .questionList[
                                              controller.currentQuestionIndex]
                                          .question ??
                                      "",
                                  textScore: controller
                                      .questionList[
                                          controller.currentQuestionIndex]
                                      .score
                                      .toString(),
                                  image: controller
                                                  .questionList[controller
                                                      .currentQuestionIndex]
                                                  .questionImageUrl ==
                                              null ||
                                          controller
                                                  .questionList[controller
                                                      .currentQuestionIndex]
                                                  .questionImageUrl ==
                                              "null"
                                      ? DecorationImage(
                                          image: AssetImage('assets/bg.jpg'),
                                          fit: BoxFit.cover)
                                      : DecorationImage(
                                          image: NetworkImage(controller
                                              .questionList[controller
                                                  .currentQuestionIndex]
                                              .questionImageUrl!),
                                          fit: BoxFit.cover),
                                ),
                                VSpace(30.h),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.h),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(30.r),
                                    onTap: () {
                                      controller.checkTappedValue("A");
                                      controller.answerQuestion("A");
                                    },
                                    child: Ink(
                                      padding: EdgeInsets.all(8.h),
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        color: controller
                                                        .questionList[controller
                                                                    .isTappedA ==
                                                                true
                                                            ? controller
                                                                    .checkingIndex -
                                                                1
                                                            : controller
                                                                .checkingIndex]
                                                        .correctAnswer ==
                                                    "A" &&
                                                controller.isTappedA == true
                                            ? Colors.green
                                            : controller
                                                            .questionList[controller
                                                                        .isTappedA ==
                                                                    true
                                                                ? controller
                                                                        .checkingIndex -
                                                                    1
                                                                : controller
                                                                    .checkingIndex]
                                                            .correctAnswer !=
                                                        "A" &&
                                                    controller.isTappedA == true
                                                ? Colors.red
                                                : AppColors.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                      ),
                                      child: Center(
                                          child: Text(
                                        controller
                                            .questionList[
                                                controller.currentQuestionIndex]
                                            .answers!
                                            .a!,
                                        style: TextStyle(
                                            color: controller
                                                            .questionList[controller
                                                                        .isTappedA ==
                                                                    true
                                                                ? controller
                                                                        .checkingIndex -
                                                                    1
                                                                : controller
                                                                    .checkingIndex]
                                                            .correctAnswer ==
                                                        "A" &&
                                                    controller.isTappedA == true
                                                ? AppColors.whiteColor
                                                : controller
                                                                .questionList[controller
                                                                            .isTappedA ==
                                                                        true
                                                                    ? controller
                                                                            .checkingIndex -
                                                                        1
                                                                    : controller
                                                                        .checkingIndex]
                                                                .correctAnswer !=
                                                            "A" &&
                                                        controller.isTappedA ==
                                                            true
                                                    ? AppColors.whiteColor
                                                    : AppColors.blackColor),
                                      )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.h),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(30.r),
                                    onTap: () {
                                      controller.checkTappedValue("B");
                                      controller.answerQuestion("B");
                                    },
                                    child: Ink(
                                      padding: EdgeInsets.all(8.h),
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        color: controller
                                                        .questionList[controller
                                                                    .isTappedB ==
                                                                true
                                                            ? controller
                                                                    .checkingIndex -
                                                                1
                                                            : controller
                                                                .checkingIndex]
                                                        .correctAnswer ==
                                                    "B" &&
                                                controller.isTappedB == true
                                            ? Colors.green
                                            : controller
                                                            .questionList[controller
                                                                        .isTappedB ==
                                                                    true
                                                                ? controller
                                                                        .checkingIndex -
                                                                    1
                                                                : controller
                                                                    .checkingIndex]
                                                            .correctAnswer !=
                                                        "B" &&
                                                    controller.isTappedB == true
                                                ? Colors.red
                                                : AppColors.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                      ),
                                      child: Center(
                                          child: Text(
                                        controller
                                            .questionList[
                                                controller.currentQuestionIndex]
                                            .answers!
                                            .b!,
                                        style: TextStyle(
                                            color: controller
                                                            .questionList[controller
                                                                        .isTappedB ==
                                                                    true
                                                                ? controller
                                                                        .checkingIndex -
                                                                    1
                                                                : controller
                                                                    .checkingIndex]
                                                            .correctAnswer ==
                                                        "B" &&
                                                    controller.isTappedB == true
                                                ? AppColors.whiteColor
                                                : controller
                                                                .questionList[controller
                                                                            .isTappedB ==
                                                                        true
                                                                    ? controller
                                                                            .checkingIndex -
                                                                        1
                                                                    : controller
                                                                        .checkingIndex]
                                                                .correctAnswer !=
                                                            "B" &&
                                                        controller.isTappedB ==
                                                            true
                                                    ? AppColors.whiteColor
                                                    : AppColors.blackColor),
                                      )),
                                    ),
                                  ),
                                ),
                                controller
                                            .questionList[
                                                controller.currentQuestionIndex]
                                            .answers!
                                            .c ==
                                        null
                                    ? SizedBox()
                                    : Padding(
                                        padding: EdgeInsets.only(bottom: 8.h),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          onTap: () {
                                            controller.checkTappedValue("C");
                                            controller.answerQuestion("C");
                                          },
                                          child: Ink(
                                            padding: EdgeInsets.all(8.h),
                                            height: 50.h,
                                            decoration: BoxDecoration(
                                              color: controller
                                                              .questionList[controller
                                                                          .isTappedC ==
                                                                      true
                                                                  ? controller
                                                                          .checkingIndex -
                                                                      1
                                                                  : controller
                                                                      .checkingIndex]
                                                              .correctAnswer ==
                                                          "C" &&
                                                      controller
                                                              .isTappedC ==
                                                          true
                                                  ? Colors.green
                                                  : controller
                                                                  .questionList[controller
                                                                              .isTappedC ==
                                                                          true
                                                                      ? controller
                                                                              .checkingIndex -
                                                                          1
                                                                      : controller
                                                                          .checkingIndex]
                                                                  .correctAnswer !=
                                                              "C" &&
                                                          controller
                                                                  .isTappedC ==
                                                              true
                                                      ? Colors.red
                                                      : AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                            ),
                                            child: Center(
                                                child: Text(
                                              controller
                                                  .questionList[controller
                                                      .currentQuestionIndex]
                                                  .answers!
                                                  .c!,
                                              style: TextStyle(
                                                  color: controller
                                                                  .questionList[controller.isTappedC ==
                                                                          true
                                                                      ? controller.checkingIndex -
                                                                          1
                                                                      : controller
                                                                          .checkingIndex]
                                                                  .correctAnswer ==
                                                              "C" &&
                                                          controller
                                                                  .isTappedC ==
                                                              true
                                                      ? AppColors.whiteColor
                                                      : controller
                                                                      .questionList[controller.isTappedC ==
                                                                              true
                                                                          ? controller.checkingIndex -
                                                                              1
                                                                          : controller
                                                                              .checkingIndex]
                                                                      .correctAnswer !=
                                                                  "C" &&
                                                              controller
                                                                      .isTappedC ==
                                                                  true
                                                          ? AppColors.whiteColor
                                                          : AppColors
                                                              .blackColor),
                                            )),
                                          ),
                                        ),
                                      ),
                                controller
                                            .questionList[
                                                controller.currentQuestionIndex]
                                            .answers!
                                            .d ==
                                        null
                                    ? SizedBox()
                                    : Padding(
                                        padding: EdgeInsets.only(bottom: 8.h),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          onTap: () {
                                            controller.checkTappedValue("D");
                                            controller.answerQuestion("D");
                                          },
                                          child: Ink(
                                            padding: EdgeInsets.all(8.h),
                                            height: 50.h,
                                            decoration: BoxDecoration(
                                              color: controller
                                                              .questionList[controller
                                                                          .isTappedD ==
                                                                      true
                                                                  ? controller
                                                                          .checkingIndex -
                                                                      1
                                                                  : controller
                                                                      .checkingIndex]
                                                              .correctAnswer ==
                                                          "D" &&
                                                      controller
                                                              .isTappedD ==
                                                          true
                                                  ? Colors.green
                                                  : controller
                                                                  .questionList[controller
                                                                              .isTappedD ==
                                                                          true
                                                                      ? controller
                                                                              .checkingIndex -
                                                                          1
                                                                      : controller
                                                                          .checkingIndex]
                                                                  .correctAnswer !=
                                                              "D" &&
                                                          controller
                                                                  .isTappedD ==
                                                              true
                                                      ? Colors.red
                                                      : AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                            ),
                                            child: Center(
                                                child: Text(
                                              controller
                                                  .questionList[controller
                                                      .currentQuestionIndex]
                                                  .answers!
                                                  .a!,
                                              style: TextStyle(
                                                  color: controller
                                                                  .questionList[controller.isTappedD ==
                                                                          true
                                                                      ? controller.checkingIndex -
                                                                          1
                                                                      : controller
                                                                          .checkingIndex]
                                                                  .correctAnswer ==
                                                              "D" &&
                                                          controller
                                                                  .isTappedD ==
                                                              true
                                                      ? AppColors.whiteColor
                                                      : controller
                                                                      .questionList[controller.isTappedD ==
                                                                              true
                                                                          ? controller.checkingIndex -
                                                                              1
                                                                          : controller
                                                                              .checkingIndex]
                                                                      .correctAnswer !=
                                                                  "D" &&
                                                              controller
                                                                      .isTappedD ==
                                                                  true
                                                          ? AppColors.whiteColor
                                                          : AppColors
                                                              .blackColor),
                                            )),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
              );
            },
          ),
        ),
      ),
    );
  }
}
