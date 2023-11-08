import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles.dart';

class AppButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String text;
  final void Function() onPressed;

  const AppButton(
      {super.key,
      this.color,
      this.textColor,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48.h,
        width: MediaQuery.sizeOf(context).width * .7,
        child: MaterialButton(
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.baseStyle.copyWith(color: textColor),
          ),
        ));
  }
}
