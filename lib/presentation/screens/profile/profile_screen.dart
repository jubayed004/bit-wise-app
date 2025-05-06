import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/core/custom_assets/assets.gen.dart';
import 'package:betwise_app/core/route/route_path.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/helper/dialog/show_custom_animated_dialog.dart';
import 'package:betwise_app/helper/image/network_image.dart';
import 'package:betwise_app/presentation/components/custom_button/custom_button.dart';
import 'package:betwise_app/presentation/components/custom_text/custom_text.dart';
import 'package:betwise_app/presentation/screens/profile/widgets/profile_box_card.dart';
import 'package:betwise_app/presentation/widget/align/custom_align_text.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final profileController = GetControllers.instance.getProfileController();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
    centerTitle: true,
          title: CustomText(
            text: "Profile",fontSize: 16,fontWeight: FontWeight.w600,
          ),

      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // profileController.getProfile();
        },
        child: CustomScrollView(
          slivers: [

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(left: 16,right: 16,top: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10), // Same as Card's border radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Custom shadow color
                      blurRadius: 24,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100.h,
                              width: 100.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: CustomNetworkImage(
                                  imageUrl: "assets/icons/Profileicon.svg",
                                ),
                              ),
                            ),
                             Gap(10),
                            Column(

                              children: [
                                CustomText(
                                  text: "Ely Mohammed",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                Gap(8),
                                Row(

                                  children: [
                                    Assets.icons.alternateEmail.svg(),
                                    Gap(4),
                                    FittedBox(child: CustomText(text: "Marvin@gmail.com",overflow: TextOverflow.ellipsis,maxLines: 2,))
                                  ],
                                ),
                                Gap(8),
                                Row(

                                  children: [
                                    Assets.icons.call.svg(),
                                    Gap(4),
                                    CustomText(text: "(555) 123-4567")
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                     Container(
                       padding: EdgeInsets.all(2),
                       decoration:BoxDecoration(
                         borderRadius: BorderRadius.circular(2),
                         color: Colors.white,
                         border: Border.all(color: AppColors.greenColor,width: 1),

                       ),
                       child: GestureDetector(
                         onTap: ()=> AppRouter.route.pushNamed(
                           RoutePath.editProfileScreen,
                         ),
                         child: Row(
                           children: [
                             Assets.icons.edit.svg(width: 14.w),
                             CustomText(text: "Edit Profile ",fontWeight: FontWeight.w500,fontSize: 10,)
                           ],
                         ),
                       ),
                     )

                      ],
                    ),

                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileBoxCard(

                      icons: Assets.icons.setting.svg(),
                      text: "Account Setting",
                      onTap: () {
                        AppRouter.route.pushNamed(RoutePath.settingsScreen);
                      },
                    ),

                    ProfileBoxCard(
                      icons: Assets.icons.givefeedback.svg(),
                      text: "Give Feedback", onTap: () {  },
                      //onTap: () => buildShowLanguageDialog(context),
                    ),
                    ProfileBoxCard(
                      icons: Assets.icons.notification.svg(),
                      text: "Notification",
                      onTap: () {
                        AppRouter.route.pushNamed(RoutePath.notifyScreen);
                      },
                    ),
                    CustomAlignText(

                      text: "more",
                      color: AppColors.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Gap(8),
                    ProfileBoxCard(
                      icons: Assets.icons.tramCondi.svg(),
                      text: "Terms & Condition",
                      onTap: () {
                        AppRouter.route.pushNamed(RoutePath.termsOfCondition);
                      },
                    ),
                    ProfileBoxCard(
                      icons: Assets.icons.privacypolice.svg(),
                      text: "Privacy policy",
                      onTap: () {
                        AppRouter.route.pushNamed(RoutePath.privacyPolicy);
                      },
                    ),
                    ProfileBoxCard(
                      icons: Assets.icons.helpsupport.svg(),
                      text: "Help/Support", onTap: () {  },
                   /*   onTap: () => buildShowSupportDialog(context),*/
                    ),
                    ProfileBoxCard(
                      icons: Assets.icons.logout.svg(),
                      text: "Log Out",
                      onTap:
                          () {
                            showCustomAnimatedDialog(
                              animationSrc: "assets/images/warning.png",
                              context: context,
                              title: "Warning",
                              subtitle: "Are you sure you want to change your subscription plan?",
                              actionButton: [
                                CustomButton(
                                  width: double.infinity,
                                  height: 36,
                                  fillColor: Colors.white,                 // White background
                                  borderWidth: 1,                          // Border width
                                  borderColor: AppColors.greenColor,               // Border color (black)
                                  onTap: () {
                                    AppRouter.route.pop();
                                  },
                                  textColor: AppColors.greenColor,
                                  title: "Cancel",
                                  isBorder: true,
                                  fontSize: 14,// Ensure the border is visible
                                ),
                                CustomButton(
                                  width: double.infinity,
                                  height: 36,
                                  onTap: ()async{

                                    AppRouter.route.pop();
                                    await Future.delayed(Duration(milliseconds: 100));


                                  },
                                  title: " Confirm",
                                  fontSize: 14,

                                ),
                              ],
                            );
                          }

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

/*  Future<Object?> buildShowLanguageDialog(
    BuildContext context,
  ) => showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withValues(alpha: 0.5),
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      final width = MediaQuery.of(context).size.width;
      return Center(
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: Color(0xFFE9EFFD),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 16,
          child: SizedBox(
            width: width,
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "select_your_preferred_language".tr,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                    Gap(12),
                    GetBuilder(
                      builder: (languageController) {
                        return Column(
                          children: List.generate(6, (index) {
                            //bool isSelected = languageController?.selectedIndex == index;
                            return Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color:
                                                isSelected
                                                    ? Color(0xFF2D6AEC)
                                                    : Colors.grey,
                                            width: 2,
                                          ),
                                        ),
                                        child:
                                            isSelected
                                                ? Center(
                                                  child: Container(
                                                    width: 12,
                                                    height: 12,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(0xFF2D6AEC),
                                                    ),
                                                  ),
                                                )
                                                : SizedBox.shrink(),
                                      ),
                                      Gap(12),
                                      //CustomText(text: AppConstants.languages[index].languageName, color: AppColors.blackColor,)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                    Gap(12),
                    CustomButton(
                      title: "apply".tr,
                      onTap: () => AppRouter.route.pop(),
                    ),
                    Gap(12),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(scale: animation, child: child),
      );
    },
  );

  Future<Object?> buildShowSupportDialog(
    BuildContext context,
  ) => showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withValues(alpha: 0.5),
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      final width = MediaQuery.of(context).size.width;
      return Center(
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 16,
          child: SizedBox(
            width: width,
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 12,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => AppRouter.route.pop(),
                          child: Container(
                            height: 30,
                            width: 30,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFE9EFFD),
                              shape: BoxShape.circle,
                            ),
                            //child: Assets.icons.remove.svg(),
                          ),
                        ),
                        Flexible(
                          child: CustomText(
                            text: "for_support_mail_us".tr,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(height: 30, width: 30),
                      ],
                    ),
                    Gap(12),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFFE9EFFD),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 6,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: AppConstants.supportEmail,
                            color: AppColors.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(5),
                          GestureDetector(
                            onTap: () async {
                              try {
                                await Clipboard.setData(
                                  const ClipboardData(
                                    text: AppConstants.supportEmail,
                                  ),
                                );
                                toastMessage(message: "copied_to_clipboard".tr);
                              } catch (e) {
                                toastMessage(
                                  message: "something_went_wrong".tr,
                                );
                              }
                            },
                            //  child: Assets.icons.copy.svg(),
                          ),
                        ],
                      ),
                    ),
                    Gap(12),
                    CustomText(
                      text: "or_whatsApp_chat".tr,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                    Gap(12),
                    GestureDetector(
                      onTap: () async {
                        try {
                          String phoneNumber = "+8801234567890";
                          String url = "https://wa.me/$phoneNumber";

                          Uri uri = Uri.parse(url);

                          if (await canLaunchUrl(uri)) {
                            await launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            );
                          } else {
                            toastMessage(message: "could_not_launch_whatsApp");
                          }
                        } catch (e) {
                          toastMessage(message: "could_not_launch_whatsApp");
                        }
                      },
                      child: Assets.images.whatsapp.image(
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(scale: animation, child: child),
      );
    },
  );*/
}

