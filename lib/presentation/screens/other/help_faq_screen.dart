import 'package:betwise_app/core/custom_assets/assets.gen.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/presentation/components/custom_text/custom_text.dart';
import 'package:betwise_app/presentation/widget/back_button/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy_faq/flutter_easy_faq.dart';
import 'package:gap/gap.dart';

class HelpFaqScreen extends StatelessWidget {
  const HelpFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: CustomText(text: "Help / Support",fontSize: 16,fontWeight: FontWeight.w500,),
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
            EasyFaq(
              backgroundColor: Colors.white,
              question: "How do I report a successful delivery?",
              answer: "Fill in the required details, including your full name, email address, and a secure password. Ensure your email is valid as it will be used for account verification and communication.",
              anserTextStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff2A2A2A)),
            ),
            Gap(16),
            EasyFaq(
              backgroundColor: Colors.white,
              question: "How do I report a successful delivery?",
              answer: "Fill in the required details, including your full name, email address, and a secure password. Ensure your email is valid as it will be used for account verification and communication.",
              anserTextStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff2A2A2A)),
            ),

            Gap(16),            EasyFaq(
              backgroundColor: Colors.white,
              question: "How can I update my vehicle or personal information?",
              answer: "Fill in the required details, including your full name, email address, and a secure password. Ensure your email is valid as it will be used for account verification and communication.",
              anserTextStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff2A2A2A)),
            ),
            Gap(16),
            EasyFaq(
              backgroundColor: Colors.white,
              question: "How do I get paid?",
              answer: "Fill in the required details, including your full name, email address, and a secure password. Ensure your email is valid as it will be used for account verification and communication.",
              anserTextStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff2A2A2A)),
            ),
            Gap(16),
            EasyFaq(
              backgroundColor: Colors.white,
              question: "How do I report a successful delivery?",
              answer: "Fill in the required details, including your full name, email address, and a secure password. Ensure your email is valid as it will be used for account verification and communication.",
              anserTextStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff2A2A2A)),
            ),
            Gap(16),
            CustomText(text: "Need More Help?",fontWeight: FontWeight.w500,fontSize: 16,textAlign: TextAlign.start,),
            Gap(16),
            Card(
              color: Colors.white,
              child:ListTile(
                leading: Assets.icons.callus.svg(),
                title: Text("Call Us (+1-212-456-7890)"),
                subtitle: Text("Our help line service is active: 24/7"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
