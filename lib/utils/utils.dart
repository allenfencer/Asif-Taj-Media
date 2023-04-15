import 'package:fluttertoast/fluttertoast.dart';

import '../constants/color.dart';

class Utils {
  static showToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColors.primaryTextTextColor,
        textColor: AppColors.whiteColor);
  }
}
