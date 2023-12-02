import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_ui/main.dart';
import 'package:login_ui/util/resources/app_strings.dart';
import 'package:login_ui/util/resources/app_style.dart';
import 'package:login_ui/util/resources/asset_manger.dart';
import 'package:login_ui/util/resources/color_manager.dart';
import 'package:login_ui/util/resources/font_constants.dart';
import 'package:login_ui/util/widgets/elevated_button_widget.dart';
import 'package:login_ui/util/widgets/underline_button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController mobileNumberController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
          //fit: StackFit.passthrough,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AssetManager.imgBgLogin,
                alignment: Alignment.topCenter,
                height: height,
                width: width,
              ),
            ),
            shadowWidget(),
            loginViewWidget(),
          ],
        ),
      ),
    );
  }

  Widget shadowWidget() {
    return Positioned(
      top: 500,
      left: 0,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorManager.colorLightPrimary,
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.outer,
              color: ColorManager.colorLightPrimary,
              blurRadius: 150,
              spreadRadius: 100,
              offset: const Offset(0, -100), // Shadow position
            ),
          ],
        ),
      ),
    );
  }

  Widget loginViewWidget() {
    return Positioned(
      top: 420,
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              AppStrings.strLoginTitle,
              style: galledStarsTextStyle(
                color: ColorManager.colorWhite,
                fontSize: 20.sp,
                fontWeight: FontWeightManager.bold,
              ),
            ),
          ),
          SizedBox(height: height * .005),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              AppStrings.strLoginDescription,
              textAlign: TextAlign.center,
              style: workSansTextStyle(
                  color: ColorManager.colorWhite.withOpacity(0.9),
                  fontSize: 14.sp,
                  fontWeight: FontWeightManager.semiBold,
                  height: 1.2),
            ),
          ),
          SizedBox(height: height * .05),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              AppStrings.phMobileNumber,
              textAlign: TextAlign.center,
              style: workSansTextStyle(
                color: ColorManager.colorWhite,
                fontSize: 14.sp,
                fontWeight: FontWeightManager.medium,
              ),
            ),
          ),
          SizedBox(height: height * .01),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CupertinoTextField(
              padding: const EdgeInsets.only(right: 12),
              placeholder: AppStrings.hintMobileNumber,
              controller: mobileNumberController,
              keyboardType: const TextInputType.numberWithOptions(decimal: false),
              onSubmitted: (value) {},
              onChanged: (value) {
                if (value.length >= 10) {
                  FocusScope.of(context).unfocus();
                }
              },
              onEditingComplete: () {},
              prefix: Container(
                margin: const EdgeInsets.only(left: 5),
                child: CountryCodePicker(
                  onChanged: (value) {},
                  padding: EdgeInsets.zero,
                  initialSelection: 'IN',
                  favorite: const ['+91', 'IN'],
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  textStyle: TextStyle(
                    color: ColorManager.colorWhite,
                    fontSize: 14.sp,
                    fontWeight: FontWeightManager.semiBold,
                    fontFamily: FontManager.fontWorkSans,
                  ),
                  flagDecoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                  flagWidth: 26.w,
                  alignLeft: false,
                ),
              ),
              suffix: Container(
                margin: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(AssetManager.imgCall, color: ColorManager.colorWhite.withOpacity(0.7)),
              ),
              placeholderStyle: workSansTextStyle(
                color: ColorManager.colorWhite.withOpacity(0.6),
                fontSize: 14.sp,
                fontWeight: FontWeightManager.semiBold,
              ),
              style: workSansTextStyle(
                color: ColorManager.colorWhite,
                fontSize: 14.sp,
                fontWeight: FontWeightManager.semiBold,
              ),
              decoration: BoxDecoration(
                //color: ColorManager.colorBgFormField,
                border: Border.all(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: ColorManager.colorPrimary,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: height * .03),
          Align(
            alignment: Alignment.center,
            child: ElevatedButtonWidget(
              btnText: AppStrings.btnLogin,
              minimumSize: const Size(226, 50),
              onPressed: () {
                if(kDebugMode) print("Login button pressed");
              },
            ),
          ),
          SizedBox(height: height * .12),
          Align(
            alignment: Alignment.center,
            child: UnderlineButtonWidget(
              text: AppStrings.btnContinueAsGuest,
              lineColor: ColorManager.colorWhite,
              textColor: ColorManager.colorWhite,
              onPress: () => _goNext(),
            ),
          ),
        ],
      ),
    );
  }

  _goNext() {
    if (kDebugMode) print("Redirect As a Guest user");
  }
}
