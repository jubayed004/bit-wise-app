import 'package:betwise_app/core/custom_assets/assets.gen.dart';
import 'package:betwise_app/presentation/components/custom_text/custom_text.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 55,
    this.width = double.maxFinite,
    required this.onTap,
    this.title = '',
    this.marginVertical = 0,
    this.marginHorizontal = 0,
    this.fillColor = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
    this.isBorder = false,
    this.fontSize,
    this.borderWidth,
    this.borderRadius,
    this.isLoading = false,
    this.showIcon = false,
    this.iconSize = 20,
    this.borderColor,
  });

  final Color? borderColor;
  final double height;
  final double? width;
  final Color? fillColor;
  final Color textColor;
  final VoidCallback onTap;
  final String title;
  final double marginVertical;
  final double marginHorizontal;
  final bool isBorder;
  final double? fontSize;
  final double? borderWidth;
  final double? borderRadius;
  final bool? isLoading;
  final bool showIcon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(),
        margin: EdgeInsets.symmetric(vertical: marginVertical, horizontal: marginHorizontal),
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: isBorder
              ? Border.all(color: borderColor ?? Colors.black, width: borderWidth ?? 2)  // Ensure fallback if borderColor is null
              : null,
          borderRadius: BorderRadius.circular(borderRadius ?? 6),
          color: fillColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              fontSize: fontSize ?? 18.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
              textAlign: TextAlign.center,
              text: title,
            ),
            Gap(4),
            // Show icon only if showIcon is true
            showIcon ? Assets.icons.arrowrighticon.svg(width: iconSize) : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}



