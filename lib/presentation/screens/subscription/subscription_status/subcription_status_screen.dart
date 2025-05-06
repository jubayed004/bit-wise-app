import 'package:betwise_app/core/custom_assets/assets.gen.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/helper/dialog/show_custom_animated_dialog.dart';
import 'package:betwise_app/presentation/components/custom_button/custom_button.dart';
import 'package:betwise_app/presentation/components/custom_text/custom_text.dart';
import 'package:betwise_app/presentation/widget/back_button/back_button.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SubscriptionStatusScreen extends StatelessWidget {
  const SubscriptionStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: CustomText(text: "Subscription status",fontWeight: FontWeight.w500,fontSize: 16,),
          leading:CustomBackButton(
            onTap: () {
              AppRouter.route.pop();
            },
          )
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               Container(
                 height: 135,
                 padding: EdgeInsets.only(left: 10),
                 decoration: BoxDecoration(
                  color: Color(0xfffffbeb),
                   borderRadius: BorderRadius.circular(8),
                   border: Border.all(color: Colors.white.withAlpha(50),width: 1),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.black.withOpacity(0.2),
                       blurRadius: 24,
                       spreadRadius: 0,
                       offset: Offset(4, 4),
                     ),
                   ]
                 ),
                 child: Stack(
                   children: [
                     Row(
                       children: [
                         Container(
                           padding: EdgeInsets.all(8),
                           decoration: BoxDecoration(
                             color: Colors.white,

                             borderRadius: BorderRadius.circular(4),

                           ),
                           child: Assets.icons.subtwoicon.svg(),
                         ),
                         Gap(10),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             CustomText(text: "Your subscription is active until:",fontSize: 12,fontWeight: FontWeight.w500,),
                             CustomText(text: "March 10, 2025",fontWeight: FontWeight.w600,fontSize: 20,),

                           ],
                         ),
                         
                       ],
                     ),
                     Positioned(
                       right: 0,
                         bottom: 0,
                         child: Assets.icons.subicon.svg()
                     )
                   ],
                 ),
               ),
            Gap(20),
            CustomText(text: "subscription Type",fontSize: 14,fontWeight: FontWeight.w400,bottom: 8,),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 2,
                color: Colors.white,
                shape: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide.none,
                  gapPadding: 100
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: CustomText(text: "Gold User",fontWeight: FontWeight.w400,fontSize: 14,textAlign: TextAlign.start,color: AppColors.secondTextColor,),
                ),
              ),
            ),
            CustomText(text: "Last Purchase Date",fontSize: 14,fontWeight: FontWeight.w400,bottom: 8,top: 8,),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 2,
                color: Colors.white,
                shape: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide.none,
                  gapPadding: 100
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: CustomText(text: "January 25, 2025",fontWeight: FontWeight.w400,fontSize: 14,textAlign: TextAlign.start,color: AppColors.secondTextColor,),
                ),
              ),
            ),
            CustomText(text: "Subscription Expiry Date",fontSize: 14,fontWeight: FontWeight.w400,bottom: 8,top: 8,),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 2,
                color: Colors.white,
                shape: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide.none,
                  gapPadding: 100
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: CustomText(text: "March 10, 2025",fontWeight: FontWeight.w400,fontSize: 14,textAlign: TextAlign.start,color: AppColors.secondTextColor,),
                ),
              ),
            ),
            Gap(20),
            CustomButton(
              onTap: (){
                showCustomAnimatedDialog(
                  animationSrc: "assets/images/warning.png",
                  context: context,
                  title: "Warning",
                  subtitle: "Would you like to renew your subscription now to avoid interruption?",
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
                   /*     showCustomAnimatedDialog(
                          context: context,
                          title: "Success",
                          subtitle: "Your password has been changed successfully.",
                          animationSrc: "assets/animation/success.json",  // Path to your Lottie animation
                          isDismissible: true,
                          actionButton: [
                            CustomButton(
                              height: 36,
                              width: 100,
                              onTap: () {
                                AppRouter.route.goNamed(RoutePath.settingsScreen);  // Navigate
                              },
                              title: "Confirm",
                              fontSize: 14,
                            ),
                          ],
                        );*/

                      },
                      title: " Confirm",
                      fontSize: 14,

                    ),
                  ],
                );
              },
              title: " Renew subscription",
            ),
            Gap(20),
            CustomButton(
              onTap: (){
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
                        /*     showCustomAnimatedDialog(
                          context: context,
                          title: "Success",
                          subtitle: "Your password has been changed successfully.",
                          animationSrc: "assets/animation/success.json",  // Path to your Lottie animation
                          isDismissible: true,
                          actionButton: [
                            CustomButton(
                              height: 36,
                              width: 100,
                              onTap: () {
                                AppRouter.route.goNamed(RoutePath.settingsScreen);  // Navigate
                              },
                              title: "Confirm",
                              fontSize: 14,
                            ),
                          ],
                        );*/

                      },
                      title: " Confirm",
                      fontSize: 14,

                    ),
                  ],
                );
              },
              title: "Change subscription",
              fillColor: Colors.white,
              isBorder: true,
              textColor: AppColors.greenColor,
            ),
          ],
        ),
      ),
    );
  }
}
