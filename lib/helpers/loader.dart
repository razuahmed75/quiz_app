import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quize_app/utils/colors.dart';

class Helpers {
  static AppLoader() {
    return SpinKitWave(
      color: AppColors.whiteColor,
      size: 50.h,
    );
  }
}
