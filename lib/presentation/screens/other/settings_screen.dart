import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/presentation/components/custom_button/custom_button.dart';
import 'package:betwise_app/presentation/components/custom_text_field/custom_text_field.dart';
import 'package:betwise_app/presentation/widget/align/custom_align_text.dart';
import 'package:betwise_app/presentation/widget/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final controller = GetControllers.instance.getOtherController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
      /*      ProfileBoxCard(
              icons: Assets.icons.lock.svg(),
              text: "change_password".tr,
              onTap: () {
                AppRouter.route.pushNamed(RoutePath.changePasswordScreen);
              },
            ),
            ProfileBoxCard(
              icons: Assets.icons.userDelete.svg(),
              text: "delete_account".tr,
              onTap: () => showDeleteConfirmDialog(context),
            ),*/
          ],
        ),
      ),
    );
  }

  void showDeleteConfirmDialog(BuildContext context) => showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withValues(alpha: 0.5),
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      final isDarkMode = Theme.of(context).brightness == Brightness.dark;
      return Dialog(
        backgroundColor: isDarkMode ? const Color(0xFF1C1B1B) : const Color(0xFFF4F4F5),
        insetPadding: const EdgeInsets.all(8),
        insetAnimationDuration: const Duration(milliseconds: 600),
        insetAnimationCurve: Curves.easeIn,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("delete_account".tr, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                Text("are_you_sure_you_want_delete_account".tr, textAlign: TextAlign.center, maxLines: 2, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                const Gap(12),
                const CustomAlignText(text: "password"),
                const Gap(8),
                CustomTextField(
                  hintText: "enter_your_password".tr,
                  isPassword: true,
                  keyboardType: TextInputType.text,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomButton(title: "yes", onTap: (){
                        if(_formKey.currentState!.validate()){
                           controller.deleteAccount();
                        }
                      },),
                    ),
                    const Gap(12),
                    Expanded(
                      child: CustomButton(title: "cancel", onTap: ()=>AppRouter.route.pop(),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
    },
  );
}
