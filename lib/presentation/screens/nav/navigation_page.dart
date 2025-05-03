/*
import 'package:betwise_app/presentation/screens/nav/controller/navigation_controller.dart';
import 'package:betwise_app/presentation/widget/custom_text/custom_text.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class NavigationPage extends StatelessWidget {
  static const String routeName = "/nav";

  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  */
/*    appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Obx(() {
          return NavigationControllerMain.to.selectedNavIndex.value == 0
              ? Builder(
                builder: (context) {
                  return CustomHomeAppbar(
                    onActionTap: () {
                      Get.toNamed(NotificationPage.routeName);
                    },
                  );
                },
              ) : CustomDefaultAppbar(
                leading: IconButton(
                  onPressed: () {
                    NavigationControllerMain.to.selectedNavIndex.value = 0;
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                ),
                title:
                    NavigationControllerMain
                        .to
                        .appbarTitle[NavigationControllerMain
                            .to
                            .selectedNavIndex
                            .value -
                        1],
              );
        }
        ),
      ),*//*



      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return IndexedStack(
                index: NavigationControllerMain.to.selectedNavIndex.value,
                children: NavigationControllerMain.to.getPages(),
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .2),
                blurRadius: 20.r,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                List.generate(
                  NavigationControllerMain.to.icons.length,
                  (index) => Expanded(
                    // Add Expanded to distribute space evenly
                    child: GestureDetector(
                      onTap: () {
                        NavigationControllerMain.to.selectedNavIndex.value =
                            index;
                      },
                      child: Obx(() {
                        bool isSelected =
                            NavigationControllerMain
                                .to
                                .selectedNavIndex
                                .value ==
                            index;
                        return Column(
                          mainAxisSize:
                              MainAxisSize
                                  .min, // Use min to prevent column from expanding
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (isSelected)
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,

                                transform: Matrix4.translationValues(0, -20, 0),
                                decoration: BoxDecoration(
                                  color:
                               Colors.white,
                                  shape: BoxShape.circle,

                                  // border: Border.all(
                                  //   width: 6.w,
                                  //   color: AppColors.kWhiteColor,
                                  // ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.blueColor.withValues(alpha: .2),
                                      blurRadius: 4.r,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(6),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  padding: EdgeInsets.all(12),
                                  // transform: Matrix4.translationValues(0, -20, 0),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? Colors.green
                                            : Colors.transparent,
                                    shape: BoxShape.circle,

                                    // border: Border.all(
                                    //   width: 6.w,
                                    //   color: AppColors.kWhiteColor,
                                    // ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.blueColor.withValues(alpha: .2),
                                        blurRadius: 4.r,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: SvgPicture.asset(
                                    NavigationControllerMain.to.icons[index],
                                    colorFilter: ColorFilter.mode(
                                      isSelected ? Colors.white : Colors.black,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              )
                            else
                              SvgPicture.asset(
                                NavigationControllerMain.to.icons[index],
                                colorFilter: ColorFilter.mode(
                                  Colors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                            if (!isSelected)
                              Padding(
                                padding: EdgeInsets.only(top: 4.w),
                                child: CustomText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,

                                  text:
                                      NavigationControllerMain.to.labels[index],
                                ),
                              ),
                          ],
                        );
                      }),
                    ),
                  ),
                ).toList(),
          ),
        ),
      ),
    );
  }
}
*/
