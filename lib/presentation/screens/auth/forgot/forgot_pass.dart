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


class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({super.key});

  final _authController = GetControllers.instance.getAuthController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(text: "verify_your_email",
                    fontWeight: FontWeight.w800,
                    fontSize: 24),
                Gap(8),
                CustomText(
                    text: "well_send_a_verification_code_to_this_email_to_confirm_your_account"
                        , color: AppColors.secondTextColor, maxLines: 3),
                const Gap(24),

                //=============================== Email text ==================================
                CustomAlignText(text: "email"),
                const Gap(8),
                CustomTextField(
                  hintText: "enter_your_email",
                  keyboardType: TextInputType.emailAddress,
                  controller: _authController.forgetEmail,
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
                Gap(24),

                Obx(() {
                  return CustomButton(
                    isLoading: _authController.forgetLoading.value,
                    title: "continue", onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _authController.forget();
                    }
                  },
                  );
                }),

                Gap(24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
