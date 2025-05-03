import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/presentation/components/custom_button/custom_button.dart';
import 'package:betwise_app/presentation/widget/align/custom_align_text.dart';
import 'package:betwise_app/presentation/widget/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final controller = GetControllers.instance.getOtherController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.password.clear();
    controller.newPassword.clear();
    controller.confirmPassword.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("change_password".tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomAlignText(text: "current_password"),
              const Gap(5),
              CustomTextField(
                hintText: "************".tr,
                isPassword: true,
                controller: controller.password,
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
              const Gap(12),
              CustomAlignText(text: "new_password".tr),
              const Gap(5),
              CustomTextField(
                hintText: "enter_your_new_password".tr,
                isPassword: true,
                controller: controller.newPassword,
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
              const Gap(12),
              CustomAlignText(text: "confirm_password".tr),
              const Gap(5),
              CustomTextField(
                hintText: "re_enter_your_new_password".tr,
                isPassword: true,
                controller: controller.confirmPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please_confirm_your_password'.tr;
                  }
                  if (value != controller.newPassword.text) {
                    return 'Passwords_do_not_match'.tr;
                  }
                  return null;
                },
              ),
              const Gap(24),
              Obx(() {
                return CustomButton(
                  title: "change_password",
                  isLoading: controller.changePasswordLoading.value,
                  onTap: () {
                    if(_formKey.currentState!.validate()){
                      controller.changePassword();
                    }
                  },
                );
              }),
              const Gap(12),
            ],
          ),
        ),
      ),
    );
  }
}
