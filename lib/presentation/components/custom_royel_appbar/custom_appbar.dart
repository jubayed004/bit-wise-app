
import 'package:betwise_app/presentation/components/custom_image/custom_image.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.leadingImage,
    this.actionImageOne,
    this.actionImageTwo,
  });

  final String? leadingImage;
  final String? actionImageOne;
  final String? actionImageTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration:  BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [  
         
          if (leadingImage != null)
            Row(
              children: [ 
                 SizedBox(
            width: 10.w,),
               BackButton()
              ],
            ),
          Row(
            children: [
              if (actionImageOne != null)
                GestureDetector(
                  onTap: (){
                    // Get.toNamed(AppRoutes.searchScreen);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomImage(
                        imageSrc: actionImageOne!,
                        height: 20.h,
                        width: 20.w,
                        imageColor: AppColors.blackColor,
                      ),
                    ),
                  ),
                ),
              SizedBox(
                width: 10.w,
              ),
              if (actionImageTwo != null)
                GestureDetector(
                  onTap: (){
                   // Get.toNamed(AppRoutes.n)
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomImage(
                        imageSrc: actionImageTwo!,
                        imageColor: AppColors.blackColor,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                  ),
                ),
              SizedBox(
                width: 10.w,
              ),
            ],
          )
        ],
      ),
    );
  }
}
