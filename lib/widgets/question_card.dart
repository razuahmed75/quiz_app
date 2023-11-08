import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quize_app/config/spacing.dart';

class QuestionCard extends StatelessWidget {
  final String text;
  final String textScore;
  final DecorationImage image;
  const QuestionCard({
    Key? key,
    required this.text,
    required this.image,
    required this.textScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(20.h),
      height: 190.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Container(
              height: 60.h,
              width: 60.h,
              decoration: BoxDecoration(
                  color: Colors.grey, shape: BoxShape.circle, image: image)),
          Text(
            "Score: " + textScore,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            text,
          ),
          VSpace(10.h),
        ],
      ),
    );
  }
}
