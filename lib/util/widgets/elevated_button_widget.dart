import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_ui/main.dart';
import 'package:login_ui/util/resources/app_style.dart';
import 'package:login_ui/util/resources/color_manager.dart';
import 'package:login_ui/util/resources/font_constants.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String btnText;
  final Size minimumSize;
  final bool disableButton;
  final Function() onPressed;

  const ElevatedButtonWidget(
      {required this.btnText, required this.minimumSize, this.disableButton = false, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: width * .7,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorManager.colorLightPrimary,
              ColorManager.colorPrimary,
            ],
          ),
          color: ColorManager.colorLightPrimary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            minimumSize: minimumSize,
            shadowColor: ColorManager.colorPrimary.withOpacity(0.25),
            elevation: 20,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          onPressed: !disableButton ? onPressed : null,
          child: Text(
            btnText,
            style: workSansTextStyle(
              color: ColorManager.colorWhite,
              fontSize: 16.sp,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
