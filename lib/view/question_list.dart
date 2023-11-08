import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/spacing.dart';
import '../model/quiz_model.dart';
import '../utils/colors.dart';
import '../widgets/question_card.dart';

class QuestionList extends StatelessWidget {
  final Question data;
  const QuestionList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          QuestionCard(
            text: data.question ?? "",
            image: data.questionImageUrl == null
                ? DecorationImage(
                    image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)
                : DecorationImage(
                    image: NetworkImage(data.questionImageUrl!),
                    fit: BoxFit.cover),
          ),
          VSpace(30.h),
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: InkWell(
              borderRadius: BorderRadius.circular(30.r),
              onTap: () {},
              child: Ink(
                padding: EdgeInsets.all(8.h),
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Center(child: Text("A. Dhaka")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
