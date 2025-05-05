import 'package:betwise_app/core/route/route_path.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/helper/dialog/custom_dialog.dart';
import 'package:betwise_app/presentation/components/custom_button/custom_button.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:flutter/material.dart';

class SubscriptionPlanView extends StatelessWidget {
  final String planName;
  final double price;
  final String text;
  final Color color;
  final Color containerColor;


  // Ensure the constructor accepts both parameters
  const SubscriptionPlanView({super.key, required this.planName, required this.price, required this.text, required this.color, required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.blackColor.withValues(alpha: 0.1),
            )
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Monthly Plan Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$planName Plan",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        text,
                        style: TextStyle(color: color, fontWeight: FontWeight.w300,fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Gap(10),
                // Plan Price
                Text.rich(
                  TextSpan(
                  text: "\$50",// Default style
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30,color: AppColors.greenColor),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' / month',
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Gap(15),
                // Features List
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFeature("Priority listing"),
                    Gap(14),
                    _buildFeature("Customer messaging"),
                    Gap(14),
                    _buildFeature("Advanced analytics"),
                    Gap(14),
                    _buildFeature("Premium support"),
                    Gap(14),
                    _buildFeature("Customer messaging"),
                  ],
                ),
                Gap(20),
                // Subscribe Now Button
             CustomButton(onTap: (){

               showCustomAnimatedDialog(
                 context: context,
                 title: "Success",
                 subtitle: "Your subscription plan has been changed successfully.",
                 animationSrc: "assets/animation/success.json",  // Path to your Lottie animation
                 isDismissible: true,
                 actionButton: [
                   Expanded(
                     child: SizedBox(
                       width: 50,
                       child: CustomButton(
                         height: 36,
                         onTap: () {
                           // Close the success dialog
                           //Navigator.pop(context);  // Close the success dialog
                           // Navigate to the subscription screen
                           AppRouter.route.goNamed(RoutePath.signInScreen);  // Navigate
                         },
                         title: "Confirm",
                         fontSize: 14,
                       ),
                     ),
                   ),
                 ],
               );


               /*  showCustomAnimatedDialog(
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
                       // Your action
                     },
                     textColor: AppColors.greenColor,
                     title: "Cancel",
                     isBorder: true,
                     fontSize: 14,// Ensure the border is visible
                   ),
                   CustomButton(
                     width: double.infinity,
                     height: 36,
                     onTap: (){



                     },
                     title: " Confirm",
                     fontSize: 14,

                   ),
                 ],
               );*/


             },
             title: "Subscribe Now",
             )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeature(String feature) {
    return Row(
      children: [
        Icon(Icons.check, color: Color(0xFF22C55E), size: 20),
        Gap(8),
        Text(feature),
      ],
    );
  }
}

