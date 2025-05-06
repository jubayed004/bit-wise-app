import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/core/custom_assets/assets.gen.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/presentation/components/custom_image/custom_image.dart';
import 'package:betwise_app/presentation/components/custom_text/custom_text.dart';
import 'package:betwise_app/presentation/widget/back_button/back_button.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'model/notify_model.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({super.key});

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  final controller = GetControllers.instance.getNotifyController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: CustomText(text: "Notification",fontWeight: FontWeight.w500,fontSize: 16,),
          leading:CustomBackButton(
            onTap: () {
              AppRouter.route.pop();
            },
          )


      ),
      body: RefreshIndicator(
        onRefresh: () async{
            //controller.pagingController.refresh();
        },
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 20),
          child: Column(

            children: [
              Container(
                //padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 24,
                        offset: Offset(1, 1),
                      )
                    ]
                ),
                child: ListTile(
                  title: CustomText(text:  "Subscription Updated", maxLines: 2, color: AppColors.blackColor,textAlign: TextAlign.start,fontSize: 14,fontWeight: FontWeight.w500,),
                  subtitle:   CustomText(text:  "Your subscription to Gold Analyst – Mark Jensen has been updated successfully.",
                    maxLines: 4,
                    color: AppColors.blackColor,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing:  Assets.icons.remove.svg(
                    height: 26,
                    width: 26,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF6B7280),
                      BlendMode.srcIn,
                    ),
                  ),
                  leading: Container(
                    padding: EdgeInsets.only(left: 4,right: 4,top: 12,bottom: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(color: Colors.black.withAlpha(40),width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 24,
                            offset: Offset(1, 1),
                          )
                        ]
                    ),
                    child: CustomImage(imageSrc: "assets/icons/bwpicon.svg",),
                  ),
                )
              ),
            ],
          ),
        )

/*Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 4,right: 4,top: 12,bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(color: Colors.white.withAlpha(7),width: 1)
                          ),
                            child: CustomImage(imageSrc: "assets/icons/bwpicon.svg",),
                        ),
                        Gap(16),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [


                              ],
                            ),
                        ),
                        GestureDetector(
                          onTap: () {
                            *//*if(item.id != null ){
                                  //  controller.deleteNotification(item.id?? "");
                                  }*//*
                          },
                          child: Assets.icons.remove.svg(
                            height: 26,
                            width: 26,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFF6B7280),
                              BlendMode.srcIn,
                            ),
                          ),

                        ),
                      ],
                    ),

                  ],
                ),*/
        /*PagedListView<int, Widget>(
   pagingController: controller.pagingController,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          builderDelegate: PagedChildBuilderDelegate<Widget>(
            itemBuilder: (context, item, index){
              return
            },
          ),
        ),*/
      ),
    );
  }
}
