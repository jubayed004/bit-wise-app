import 'package:betwise_app/core/custom_assets/assets.gen.dart';
import 'package:betwise_app/core/dependency/get_it_injection.dart';
import 'package:betwise_app/core/route/route_path.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/helper/local_db/local_db.dart';
import 'package:betwise_app/presentation/components/custom_image/custom_image.dart';
import 'package:betwise_app/presentation/widget/custom_text/custom_text.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final DBHelper dbHelper = serviceLocator();
  @override
  void initState() {
    super.initState();
   checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
final token = await dbHelper.getToken();

    Future.delayed(Duration(seconds: 2), () {
      if (token.isNotEmpty && !(JwtDecoder.isExpired(token))) {
        AppRouter.route.goNamed(RoutePath.navigationPage);
      } else {
        AppRouter.route.goNamed(RoutePath.onboardingScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Assets.images.splashimage.image(width: 230.w)


                /*Animate(
                      effects: [
                        MoveEffect(
                            begin: Offset(-width, 0),
                            end: Offset(0, 0),
                            duration: 800.ms,
                            curve: Curves.easeOut,
                        ),
                        FadeEffect(duration: 500.ms),
                      ],
                      //child: Assets.images.splashLogo.image(height: 50, width: 50),
                  ),*/
              ),
              Gap(12),
        /*  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Animate(
                effects: [FadeEffect(duration: 600.ms, delay: 1000.ms)],
                child: CustomText(text: "CIGARS", fontWeight: FontWeight.w800, fontSize: 16, color: AppColors.primaryColor,),
              ),
              Gap(5),
              Animate(
                effects: [FadeEffect(duration: 600.ms, delay: 1600.ms)],
                child: CustomText(text: "LOUNGES", fontWeight: FontWeight.w800, fontSize: 16, color: AppColors.primaryColor,),
              ),
              Gap(5),
              Animate(
                effects: [FadeEffect(duration: 600.ms, delay: 2200.ms)],
                child: CustomText(text: "DIRECTORY", fontWeight: FontWeight.w800, fontSize: 16, color: AppColors.primaryColor,),
              ),
            ],
          ),*/
        /*  Gap(5),
          Animate(
            effects: [FadeEffect(duration: 600.ms, delay: 2800.ms)],
            child: CustomText(text: "by_and_for_the_community", color: AppColors.whiteColor),
          ),*/
            ],
          ),
        ),
      ),
    );
  }
}
