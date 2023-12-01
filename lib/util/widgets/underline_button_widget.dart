import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_ui/util/resources/font_constants.dart';

class UnderlineButtonWidget extends StatelessWidget {
  final Function() onPress;
  String text;
  Color textColor;
  Color lineColor;
  final bool disableButton;

  UnderlineButtonWidget(
      {required this.text,
      required this.textColor,
      required this.lineColor,
      this.disableButton = false,
      required this.onPress,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !disableButton ? onPress : null,
      child: Text(
        text,
        style: TextStyle(
          shadows: [
            Shadow(
              color: lineColor,
              offset: const Offset(0, -5),
            )
          ],
          color: Colors.transparent,
          decoration: TextDecoration.underline,
          decorationColor: textColor,
          decorationThickness: 2,
          fontSize: 14.sp,
          fontWeight: FontWeightManager.medium,
          fontFamily: FontManager.fontWorkSans,
        ),
      ),
    );
  }
}
