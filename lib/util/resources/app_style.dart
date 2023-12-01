import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_ui/util/resources/color_manager.dart';
import 'package:login_ui/util/resources/font_constants.dart';
import 'package:pinput/pinput.dart';

TextStyle workSansTextStyle(
    {Color? color, double fontSize = FontSize.s14, FontWeight fontWeight = FontWeightManager.regular, double height = 1.0}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontManager.fontWorkSans,
    height: height,
  );
}

TextStyle galledStarsTextStyle(
    {Color? color, double fontSize = FontSize.s14, FontWeight fontWeight = FontWeightManager.regular, double height = 1.0}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontManager.fontGalledStars,
    height: height,
  );
}

flushBarMessage(
  BuildContext context,
  String message, {
  Color textColor = Colors.white,
  double fontSize = 16.0,
  FlushbarPosition flushBarPosition = FlushbarPosition.TOP,
  @required bool? isError,
}) {
  showFlushbar(
    context: context,
    flushbar: Flushbar(
      message: message,
      backgroundColor: isError == null
          ? ColorManager.colorPrimary
          : isError
              ? ColorManager.colorError
              : ColorManager.colorSuccess,
      messageColor: textColor,
      messageSize: fontSize,
      flushbarPosition: flushBarPosition,
      borderRadius: BorderRadius.circular(8),
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      duration: const Duration(seconds: 3),
      icon: isError! ? const Icon(Icons.error, size: 28, color: Colors.white) : null,
    )..show(context),
  );
}

final defaultPinTheme = PinTheme(
  width: 75,
  height: 75,
  textStyle: workSansTextStyle(fontSize: 24.sp, color: ColorManager.colorDarkText, fontWeight: FontWeightManager.medium),
  decoration: BoxDecoration(
    color: ColorManager.colorBgFormField,
    border: Border.all(color: ColorManager.colorBorder, width: 1),
    borderRadius: BorderRadius.circular(100),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  color: ColorManager.colorDarkPink.withOpacity(0.20),
  border: Border.all(color: ColorManager.colorDarkPink.withOpacity(0.70), width: 1),
  borderRadius: BorderRadius.circular(100),
);

final submittedPinTheme = defaultPinTheme.copyDecorationWith(
  color: ColorManager.colorDarkPink.withOpacity(0.20),
  border: Border.all(color: ColorManager.colorDarkPink.withOpacity(0.70), width: 1),
  borderRadius: BorderRadius.circular(100),
);
