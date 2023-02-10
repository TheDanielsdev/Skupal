import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../enums.dart';
import '../helper/appcolors.dart';

void showSnackBar({
  required BuildContext context,
  required Message messageType,
  required String snackText,
}) {
  late Color backgroundColor;
  late String snackTitle;
  late String lottieAsset;

  switch (messageType) {
    case Message.error:
      {
        backgroundColor = AppColor.State_Error;
        //add assets/ back when you want to test on a mobile phone
        lottieAsset = 'anim/error_anim.json';
        snackTitle = 'Error';
      }
      break;
    case Message.success:
      {
        backgroundColor = AppColor.Success;
        //add assets/ back when you want to test on a mobile phone
        lottieAsset = 'anim/success_anim.json';
        snackTitle = 'Success';
      }
      break;
    case Message.warning:
      {
        backgroundColor = AppColor.State_Warning;
        //add assets/ back when you want to test on a mobile phone
        lottieAsset = 'anim/warning_anim.json';
        snackTitle = 'Warning';
      }
      break;
    default:
  }

  SnackBar snackBar = SnackBar(
    backgroundColor: backgroundColor,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    behavior: SnackBarBehavior.floating,
    content: ZoomIn(
      duration: Duration(milliseconds: 400),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Lottie.asset(lottieAsset, height: 50),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  snackTitle,
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColor.White_Color),
                ),
                Text(
                  snackText,
                  style: TextStyle(
                      fontFamily: 'CerebriSansPro-Regular',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColor.White_Color),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
