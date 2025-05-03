import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/core/custom_assets/assets.gen.dart';
import 'package:betwise_app/core/route/route_path.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/presentation/components/custom_button/custom_button.dart';
import 'package:betwise_app/presentation/components/custom_image/custom_image.dart';
import 'package:betwise_app/presentation/components/custom_royel_appbar/custom_appbar.dart';
import 'package:betwise_app/presentation/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:betwise_app/presentation/components/custom_text/custom_text.dart';
import 'package:betwise_app/presentation/screens/onboarding/controller/onboarding_controller.dart';
import 'package:betwise_app/presentation/widget/custom_text/custom_text.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'model/onboarding_model.dart';


class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final _controller = GetControllers.instance.getOnboardingController();
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: Obx(
              () {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 24,top: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(onPressed: () {
                            //_controller.currentIndex.value-1;
                            if(_controller.currentIndex.value>=0){
                              _controller.currentIndex.value = 1;
                            } if(_controller.currentIndex.value>=1){
                              _controller.currentIndex.value = 0;
                            } if(_controller.currentIndex.value>=2){
                              _controller.currentIndex.value = 1;
                            }
                          },icon: Icon(Icons.arrow_back),),
                          Spacer(),
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: (){
                                AppRouter.route.pushNamed(RoutePath.signInScreen);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: "Skip",
                                  fontSize: 16.sp, // Bigger text for tablets
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.greenColor,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),

                  CustomImage(
                    width: 350.w,
                    boxFit: BoxFit.fill,
                    imageSrc: contents[_controller.currentIndex.value].image,
                  ),
                  CustomText(
                    text: contents[_controller.currentIndex.value].title,
                    fontSize:32.sp, // Bigger text for tablets
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor,
                    textAlign: TextAlign.center,
                  maxLines: 2,
                  ),
                  CustomText(
                    text: contents[_controller.currentIndex.value].details,
                    fontSize:14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondTextColor,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,(index) => buildDot(index, context),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 12.h,
                  ),

                  CustomButton(
                    onTap: () {

                      if(_controller.currentIndex.value<2){
                        _controller.currentIndex.value = _controller.currentIndex.value+1;
                      }else{
                        AppRouter.route.pushNamed(RoutePath.signInScreen);
                      }
                    },
                    title: _controller.currentIndex.value >= 2
                        ? "Continue "
                        : 'Next',
                    fontSize: 16.sp, // Bigger button text for tablets
                    width: double.infinity,
                    height: 60,
                    fillColor: AppColors.greenColor,
                    // Wider button on tablets
                  )
                ],
              ),
            );
          }
      ),
    );
  }

  buildDot(int index, BuildContext context) {
    final _controller = GetControllers.instance.getOnboardingController();
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Container(
        height: 6,
        width: _controller.currentIndex.value == index ?24 : 6,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _controller.currentIndex.value== index ? AppColors.greenColor : AppColors.lightGray,

        ),
      ),
    );
  }
}


/*class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final CarouselController _carouselController = CarouselController(); // CarouselController
    final _controller = GetControllers.instance.getOnboardingController();
    Brightness themeMode = Theme.of(context).brightness;
    bool isDarkMode = themeMode == Brightness.dark;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, size: 34),
        actions: [
          GestureDetector(
            child: CustomText(
              text: "Skip",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.greenColor,
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 40, left: 16, right: 16),
        child: CustomButton(
          onTap: () {
            setState(() {
              // Increment the selected index to move to the next image
              if (_controller.selectedIndex.value < _controller.imgList.length - 1) {
                _controller.selectedIndex.value++; // Increment to next image
              } else {
                _controller.selectedIndex.value = 0; // Reset to first image
              }
              // Move carousel to the corresponding image
              _carouselController.animateTo(5, duration: Duration(milliseconds: 100), curve: Curves.bounceInOut);
            });
          },
          title: "Next",
          fontSize: 18,
          textColor: AppColors.whiteColor,
          icon: true,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///=================> Carousel Slider for Image <=================///
              CarouselSlider.builder(

                itemCount: _controller.imgList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CustomImage(
                      imageSrc: _controller.imgList[index],
                      width: 0.8.sw,
                      height: 200.h,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  aspectRatio: 16 / 14,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _controller.selectedIndex.value = index; // Update selected index when carousel page changes
                    });
                  },
                ),
              ),



              SizedBox(height: height / 20),
              CustomText(
                text: "Welcome to Bet Wise Easy Money Picks!",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                maxLines: 2,
              ),
              Gap(4),
              CustomText(
                text:
                "Your journey to smarter sports betting starts here. Follow top cappers, get winning tips, and stay ahead!",
                color: AppColors.secondTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                maxLines: 2,
              ),
              SizedBox(height: height / 20),

              ///=================> Dot Indicator (Duplicated) <=================///
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _controller.imgList.length,
                      (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 8,
                    width: _controller.selectedIndex.value == index ? 16 : 8,
                    decoration: BoxDecoration(
                      color:
                      _controller.selectedIndex.value == index
                          ? AppColors.primaryColor
                          : AppColors.lightGray,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
