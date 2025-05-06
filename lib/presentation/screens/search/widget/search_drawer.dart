import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/core/custom_assets/assets.gen.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/presentation/components/custom_button/custom_button.dart';
import 'package:betwise_app/presentation/components/custom_text/custom_text.dart';

import 'package:betwise_app/presentation/widget/align/custom_align_text.dart';
import 'package:betwise_app/presentation/widget/custom_text/custom_text.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';


class SearchDrawer extends StatefulWidget {
  const SearchDrawer({super.key});

  @override
  State<SearchDrawer> createState() => _SearchDrawerState();
}

class _SearchDrawerState extends State<SearchDrawer> {

  final controller = GetControllers.instance.getSearchScreenController();

  final List<String> distance = ["5 Km", "10 Km", "25 Km", "50 Km"];

  @override
  void dispose() {
    controller.searchController.clear();
    controller.search.value = "";
    controller.categoryId.value = "";
    controller.countryID.value = "";
    controller.cityId.value = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFF0FDF4),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Gap(44),
      /*        Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      AppRouter.route.pop();
                    },
                    child: Assets.icons.arrow.svg(
                        colorFilter: ColorFilter.mode(
                            AppColors.blackColor, BlendMode.srcIn),
                        height: 24,
                        width: 24),
                  ),

                ],
              ),
              Gap(12),*/
              CustomAlignText(text: "Sort By"),
              Gap(8.0),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(color: AppColors.blackColor)
                ),
                hint: CustomText(
                  text: "Select One ", color: AppColors.blackColor,fontSize: 16),
                items: distance.map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: CustomText(text: item),
                    )).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.categoryId.value = value;
                  }
                },
                style: TextStyle(color: AppColors.blackColor),
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_downward_rounded,
                      color: AppColors.blackColor),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.whiteColor
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              Gap(12),
              CustomAlignText(text: "Sport Type"),
              Gap(8.0),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(color: AppColors.blackColor)
                ),
                hint: CustomText(
                  text: "Select One ", color: AppColors.blackColor,fontSize: 16,),
                items: distance.map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: CustomText(text: item),
                    )).toList(),
                onChanged: (value) {

                },
                style: TextStyle(color: AppColors.blackColor),
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_downward_rounded,
                      color: AppColors.blackColor),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.whiteColor
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              Gap(12),
              CustomAlignText(text: "Prediction Type".tr),
              Gap(8.0),
          DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fillColor: Colors.white,
                filled: true,
                hintStyle: TextStyle(color: AppColors.blackColor)
            ),
            hint: CustomText(
              text: "Select One ", color: AppColors.blackColor,fontSize: 16,),
            items: distance.map((
                item) =>
                DropdownMenuItem<String>(
                  value: item,
                  child: CustomText(text: item),
                )).toList(),
            onChanged: (value) {
              if(value != null){
                controller.countryID.value = value;
              }
            },
            style: TextStyle(color: AppColors.blackColor),
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(Icons.arrow_downward_rounded,
                  color: AppColors.blackColor),
              iconSize: 24,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.whiteColor
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
              Gap(12),
              CustomAlignText(text: "Analyst Type"),
              Gap(8.0),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(color: AppColors.blackColor)
                ),
                hint: CustomText(
                  text: "Select One ".tr, color: AppColors.blackColor,fontSize: 16,),
                items: distance.map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: CustomText(text: item),
                    )).toList(),
                onChanged: (value) {
                  if(value != null){
                    controller.cityId.value = value;
                  }

                },
                style: TextStyle(color: AppColors.blackColor),
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_downward_rounded,
                      color: AppColors.blackColor),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.whiteColor
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),

              Gap(12),
              CustomAlignText(text: "Odds Range"),
              Gap(8.0),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(color: AppColors.blackColor)
                ),
                hint: CustomText(
                  text: "Select One ".tr, color: AppColors.blackColor,fontSize: 16,),
                items: distance.map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: CustomText(text: item),
                    )).toList(),
                onChanged: (value) {
                  if(value != null){
                    controller.cityId.value = value;
                  }

                },
                style: TextStyle(color: AppColors.blackColor),
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_downward_rounded,
                      color: AppColors.blackColor),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.whiteColor
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              Gap(24),
              CustomButton(
                title: " Apply filter",
                onTap: () {
                  controller.pagingController.refresh();
                  AppRouter.route.pop();
                },
              ),
              Gap(20),
              CustomButton(
                fillColor: Colors.white,                 // White background
                                   // Border width
                borderColor: AppColors.greenColor,               // Border color (black)
                onTap: () {
                  AppRouter.route.pop();
                },
                textColor: AppColors.greenColor,
                title: "Close",
                isBorder: true,

              ),
            ],
          )



          /*Obx(() {
  *//*          switch (controller.countryCity.value) {
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.error:
                return Center(child: ErrorCard(onTap: () => controller.getCountryCity()));
              case Status.noDataFound:
                return Center(child: NoDataCard(onTap: () => controller.getCountryCity()));
              case Status.internetError:
                return Center(child: NoInternetCard(onTap: () => controller.getCountryCity()));
              case Status.completed:

                return
 }
*//*
           return
          }
          ),*/
        ),
      ),
    );
  }
}
