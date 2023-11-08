import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quize_app/config/spacing.dart';
import 'package:quize_app/utils/hive/hive_helper.dart';
import '../utils/colors.dart';
import '../utils/hive/keys.dart';
import '../utils/styles.dart';
import '../widgets/app_button.dart';
import 'questions_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/quiz.png',
                  height: 300.h,
                  width: 300.h,
                  fit: BoxFit.cover,
                ),
              ),
              VSpace(40.h),
              Text("Let's Play!", style: Styles.extraLargeText),
              VSpace(2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("High Score:", style: Styles.largeText),
                  HSpace(10.w),
                  Text("${HiveHelp.read(Keys.highScore) ?? 0}", style: Styles.largeText),
                ],
              ),
              VSpace(30.h),
              AppButton(
                  text: "Play Now",
                  color: Color.fromARGB(255, 106, 10, 223),
                  textColor: AppColors.whiteColor,
                  onPressed: () => Get.to(() => QuestionsPage())),
            ],
          ),
        ),
      ),
    );
  }
}
