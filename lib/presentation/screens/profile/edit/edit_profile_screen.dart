/*
import 'dart:io';
import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/helper/image/network_image.dart';
import 'package:betwise_app/presentation/components/custom_button/custom_button.dart';
import 'package:betwise_app/presentation/components/custom_text_field/custom_text_field.dart';
import 'package:betwise_app/presentation/widget/align/custom_align_text.dart';
import 'package:betwise_app/presentation/widget/text_field/custom_text_field.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final controller = GetControllers.instance.getProfileController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edit_profile".tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Obx(() {
                          return controller.selectedImage.value != null? Image.file(File(controller.selectedImage.value?.path??""), fit: BoxFit.cover) :
                          CustomNetworkImage(imageUrl: controller.profile.value.data?.profileImage?? "");
                        }),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 2,
                      child: GestureDetector(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor,
                          ),
                          child: Icon(Iconsax.camera, size: 16, color: AppColors.blackColor,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(24),
              ///=============================== Full name text ==================================
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
                          textEditingController: controller.firstName,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'first_name_is_required'.tr;
                            }
                            return null;
                          },
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
                          textEditingController: controller.lastname,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'last_name_is_required'.tr;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Gap(12),

              ///=============================== PHONE text ==================================
              CustomAlignText(text: "${ "phone_number".tr}:"),
              const Gap(8),
              CustomTextField(
                hintText: "enter_phone_number".tr,
                keyboardType: TextInputType.number,
                controller: controller.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'phone_number_is_required'.tr;
                  }
                  return null;
                },
              ),
              const Gap(12),


              ///=============================== Sign Up text ==================================
              const Gap(12),
              Obx(() {
                return CustomButton(
                  title: "update",

                  isLoading: controller.isUpdateLoading.value,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      controller.updateProfile();
                    }
                  },
                );
              }),
              const Gap(44),
            ],
          ),
        ),
      ),
    );
  }
}
*/
