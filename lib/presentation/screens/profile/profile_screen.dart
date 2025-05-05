/*
import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/core/route/route_path.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/helper/image/network_image.dart';
import 'package:betwise_app/helper/toast_message/toast_message.dart';
import 'package:betwise_app/presentation/components/custom_button/custom_button.dart';
import 'package:betwise_app/presentation/components/custom_text/custom_text.dart';
import 'package:betwise_app/presentation/screens/no_internet/error_card.dart';
import 'package:betwise_app/presentation/screens/no_internet/no_data_card.dart';
import 'package:betwise_app/presentation/screens/no_internet/no_internet_card.dart';
import 'package:betwise_app/presentation/widget/custom_text/custom_text.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:betwise_app/utils/app_const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final profileController = GetControllers.instance.getProfileController();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("profile".tr),
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          profileController.getProfile();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: (height/3)-40,
                width: width,
                child: Obx(() {
                  switch (profileController.loading.value) {
                    case Status.loading:
                      return Center(
                        child: SpinKitCircle(
                          color: Colors.white,
                          size: 40.0,
                        ),
                      );
                    case Status.internetError:
                      return Center(child: NoInternetCard(onTap: ()=>profileController.getProfile()));
                    case Status.error:
                      return Center(child: ErrorCard(onTap: ()=>profileController.getProfile()));
                    case Status.noDataFound:
                      return Center(child: NoDataCard(onTap: ()=>profileController.getProfile()));
                    case Status.completed:
                      final data = profileController.profile.value.data;
                      return Column(
                        children: [

                          SizedBox(
                            height: 100.h,
                            width: 100.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CustomNetworkImage(imageUrl: data?.profileImage??"",)
                            ),
                          ),
                          Gap(12),
                          CustomText(text: "${data?.firstName} ${data?.lastName}", fontWeight: FontWeight.w800, fontSize: 18,),
                          Gap(8),
                          GestureDetector(
                            onTap: ()=> AppRouter.route.pushNamed(RoutePath.editProfileScreen),
                            child: Container(
                              width: width/2,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.primaryColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                 // Assets.icons.edit.svg(),
                                  Gap(8),
                                  CustomText(text: "edit_profile".tr, color: AppColors.blackColor, fontWeight: FontWeight.w800,),
                                ],
                              ),
                            ),
                          ),
                          Gap(12),
                        ],
                      );
                  }
                }),
              ),
            ),
           */
/* SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileBoxCard(
                      icons: Assets.icons.settings.svg(),
                      text: "account_setting".tr,
                      onTap: (){
                        AppRouter.route.pushNamed(RoutePath.settingsScreen);
                      },
                    ),
                    Obx((){
                      return profileController.isAdmin.value? ProfileBoxCard(
                        icons: Assets.icons.board.svg(),
                        text: "dashboard".tr,
                        onTap: (){

                          AppRouter.route.pushNamed(RoutePath.dashboardScreen);
                        },
                      ): SizedBox();
                    }),
                    ProfileBoxCard(
                      icons: Assets.icons.language.svg(),
                      text: "language".tr,
                      onTap: ()=>buildShowLanguageDialog(context),
                    ),
                    ProfileBoxCard(
                      icons: Assets.icons.notification.svg(),
                      text: "notification".tr,
                      onTap: (){
                        AppRouter.route.pushNamed(RoutePath.notifyScreen);
                      },
                    ),
                    CustomAlignText(text: "more", color: AppColors.whiteColor, fontSize: 16,fontWeight: FontWeight.w800),
                    Gap(8),
                    ProfileBoxCard(
                      icons: Assets.icons.terms.svg(),
                      text: "terms_of_conditions".tr,
                      onTap: (){
                        AppRouter.route.pushNamed(RoutePath.termsOfCondition);
                      },
                    ),
                    ProfileBoxCard(
                      icons: Assets.icons.privacy.svg(),
                      text: "privacy_policy".tr,
                      onTap: (){
                        AppRouter.route.pushNamed(RoutePath.privacyPolicy);
                      },
                    ),
                    ProfileBoxCard(
                      icons: Assets.icons.help.svg(),
                      text: "help_support".tr,
                      onTap: ()=>buildShowSupportDialog(context),
                    ),
                    ProfileBoxCard(
                      icons: Assets.icons.logout.svg(),
                      text: "log_out".tr,
                      onTap: ()=> showCustomAnimatedDialog(
                        context: context,
                        title: "logout".tr,
                        subtitle: "are_you_sure_you_want_logout".tr,
                        actionButton: [
                          Expanded(
                            child: CustomButton(text: "cancel".tr, onTap: ()=>AppRouter.route.pop()),
                          ),
                          const Gap(12),
                          Expanded(
                            child: CustomButton(text: "logout".tr, onTap: () async {
                              final DBHelper dbHelper = serviceLocator();
                              await dbHelper.logOut();
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),*//*

          ],
        ),
      ),
    );
  }

  Future<Object?> buildShowLanguageDialog(BuildContext context)=>showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withValues(alpha: 0.5),
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      final width = MediaQuery.of(context).size.width;
      return Center(
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: Color(0xFFE9EFFD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 16,
          child: SizedBox(
            width: width,
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(text: "select_your_preferred_language".tr, color: AppColors.blackColor, fontWeight: FontWeight.w800, fontSize: 16),
                    Gap(12),
                    GetBuilder(

                      builder: (languageController){
                        return Column(
                          children: List.generate(6, (index){
                            //bool isSelected = languageController?.selectedIndex == index;
                            return Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: GestureDetector(
                                onTap: (){

                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color:*/
/* isSelected ? Color(0xFF2D6AEC) : *//*
Colors.grey,
                                            width: 2,
                                          ),
                                        ),
                                        child:*/
/* isSelected ? *//*
Center(
                                          child: Container(
                                            width: 12,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF2D6AEC),
                                            ),
                                          ),
                                        ) */
/*: SizedBox.shrink(),*//*

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
                    CustomButton(title: "apply".tr,  onTap: ()=> AppRouter.route.pop(),),
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
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
    },
  );

  Future<Object?> buildShowSupportDialog(BuildContext context)=>showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withValues(alpha: 0.5),
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      final width = MediaQuery.of(context).size.width;
      return Center(
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 16,
          child: SizedBox(
            width: width,
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: ()=> AppRouter.route.pop(),
                          child: Container(
                            height: 30,
                            width: 30,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Color(0xFFE9EFFD),
                                shape: BoxShape.circle
                            ),
                            //child: Assets.icons.remove.svg(),
                          ),
                        ),
                        Flexible(child: CustomText(text: "for_support_mail_us".tr, color: AppColors.blackColor, fontWeight: FontWeight.w800, fontSize: 16, maxLines: 2,)),
                        SizedBox(
                          height: 30,
                          width: 30,
                        ),
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
                            )
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: AppConstants.supportEmail, color: AppColors.blackColor, fontSize: 16, fontWeight: FontWeight.w700),
                          Gap(5),
                          GestureDetector(
                            onTap: () async{
                              try{
                                await Clipboard.setData(const ClipboardData(text: AppConstants.supportEmail));
                                toastMessage(message: "copied_to_clipboard".tr);
                              }catch(e){
                                toastMessage(message: "something_went_wrong".tr);
                              }
                            },
                          //  child: Assets.icons.copy.svg(),
                          ),
                        ],
                      ),
                    ),
                    Gap(12),
                    CustomText(text: "or_whatsApp_chat".tr, color: AppColors.blackColor, fontWeight: FontWeight.w800, fontSize: 18),
                    Gap(12),
                 */
/*   GestureDetector(
                      onTap: () async {
                        try {
                          String phoneNumber = "+8801234567890";
                          String url = "https://wa.me/$phoneNumber";

                          Uri uri = Uri.parse(url);

                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri, mode: LaunchMode.externalApplication);
                          } else {
                            toastMessage(message: "could_not_launch_whatsApp");
                          }
                        } catch (e) {
                          toastMessage(message: "could_not_launch_whatsApp");
                        }
                      },
                      child: *//*
*/
/*Assets.images.whatsapp.image(
                        height: 50,
                        width: 50,
                      ),*//*
*/
/*
                    ),*//*

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
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
    },
  );
}

class ProfileBoxCard extends StatelessWidget {
  const ProfileBoxCard({
    super.key,
    required this.text,
    required this.icons,
    required this.onTap,
  });

  final String text;
  final Widget icons;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
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
                )
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    icons,
                    Gap(10),
                    Flexible(child: CustomText(text: text , color: AppColors.blackColor,)),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, color: AppColors.blackColor, size: 16,)
            ],
          ),
        ),
      ),
    );
  }
}
*/
