import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/presentation/components/custom_button/custom_button.dart';
import 'package:betwise_app/presentation/components/custom_text/custom_text.dart';
import 'package:betwise_app/presentation/widget/align/custom_align_text.dart';
import 'package:betwise_app/presentation/widget/custom_text/custom_text.dart';
import 'package:betwise_app/presentation/widget/text_field/custom_text_field.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _authController = GetControllers.instance.getAuthController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final isDarkMode = Theme
        .of(context)
        .brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
/*        leadingWidth: 30,
        automaticallyImplyLeading: false,
        leading: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.whiteColor
          ),
          child: Icon(Icons.arrow_back, color: AppColors.blackColor),
        ),*/
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(text: "create_your_account".tr,
                    fontWeight: FontWeight.w800,
                    fontSize: 24),
                CustomText(
                    text: "join_us_today_and_start_planning_your_events_or_managing_your_services_seamlessly"
                        , color: AppColors.secondTextColor, maxLines: 3),
                Gap(24),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CustomAlignText(text: "first_name"),
                          Gap(8.0),
                          CustomTextField(
                            hintText: "John".tr,
                            keyboardType: TextInputType.emailAddress,
                            controller: _authController.firstNameSignUp,

                          ),
                        ],
                      ),
                    ),
                    Gap(12),
                    Expanded(
                      child: Column(
                        children: [
                          CustomAlignText(text: "last_name"),
                          Gap(8.0),
                          CustomTextField(
                            hintText: "Doe".tr,
                            keyboardType: TextInputType.emailAddress,
                            controller: _authController.lastNameSignUp,

                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Gap(12),
                CustomAlignText(text: "email"),
                Gap(8.0),
                CustomTextField(
                  hintText: "enter_your_email".tr,
                  keyboardType: TextInputType.emailAddress,
                  controller: _authController.emailSignUp,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email_is_required'.tr;
                    }
                    final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                    if (!emailRegex.hasMatch(value)) {
                      return 'Enter_a_valid_email'.tr;
                    }
                    return null;
                  },
                ),
                Gap(12),
                CustomAlignText(text: "password"),
                Gap(8.0),
                CustomTextField(
                  hintText: "enter_your_password".tr,
                  isPassword: true,
                  keyboardType: TextInputType.text,
                  controller: _authController.passwordSignUp,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password_is_required'.tr;
                    }
                    if (value.length < 6) {
                      return 'Password_must_be_at_least_6_characters'.tr;
                    }
                    return null;
                  },
                ),
                Gap(12),
                CustomAlignText(text: "confirm_password"),
                Gap(8.0),
                CustomTextField(
                  hintText: "confirm_your_password".tr,
                  isPassword: true,
                  keyboardType: TextInputType.text,
                  controller: _authController.confirmPasswordSignUp,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please_confirm_your_password'.tr;
                    }
                    if (value != _authController.passwordSignUp.text) {
                      return 'Passwords_do_not_match'.tr;
                    }
                    return null;
                  },
                ),
                Gap(24),
                Obx(() {
                  return CustomButton(
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                          _authController.signUp();
                        }
                      },
                      isLoading: _authController.signUpLoading.value,
                      title: "Sign Up");
                }),
                Gap(24),
                CustomText(text: "or_login_with"),
                Gap(12),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 48,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.whiteColor)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       // Assets.icons.google.svg(),
                        Gap(8),
                        CustomText(
                          text: "Login_with_google",
                          color: AppColors.whiteColor,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(12),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 48,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.whiteColor)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      //  Assets.icons.apple.svg(),
                        Gap(8),
                        CustomText(
                          text: "login_with_apple",
                          color: AppColors.whiteColor,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
