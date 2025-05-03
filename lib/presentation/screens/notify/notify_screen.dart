/*
import 'package:betwise_app/controller/get_controllers.dart';
import 'package:cigar/controller/get_controllers.dart';
import 'package:cigar/core/custom_assets/assets.gen.dart';
import 'package:cigar/presentation/widget/custom_text/custom_text.dart';
import 'package:cigar/utils/app_colors/app_colors.dart';
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
  //final controller = GetControllers.instance.getNotifyController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notification".tr),
      ),
      body: RefreshIndicator(
        onRefresh: () async{
            //controller.pagingController.refresh();
        },
        child: PagedListView<int, Result>(
        //  pagingController: controller.pagingController,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          builderDelegate: PagedChildBuilderDelegate<Result>(
            itemBuilder: (context, item, index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Flexible(child: CustomText(text: item.title ?? "", maxLines: 2, color: AppColors.blackColor),),
                          Gap(5),
                          GestureDetector(
                            onTap: () {
                              if(item.id != null ){
                              //  controller.deleteNotification(item.id?? "");
                              }
                            },
                         */
/*   child: Assets.icons.remove.svg(
                              height: 16,
                              width: 16,
                              colorFilter: const ColorFilter.mode(
                                Color(0xFF6B7280),
                                BlendMode.srcIn,
                              ),
                            ),*//*

                          ),
                        ],
                      ),
                      const Gap(5),
                     // CustomText(text: item.message ?? "", maxLines: 6, textAlign: TextAlign.start, color: const Color(0xFF999999),fontSize: 12,),
                      const Gap(5),
                     // CustomText(text: timeago.format(item.updatedAt?? DateTime.now()), color: const Color(0xFF535353),fontSize: 12,),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
*/
