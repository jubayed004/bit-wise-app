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



      ),
      body: RefreshIndicator(
        onRefresh: () async{
            //controller.pagingController.refresh();
        },
        child: PagedListView<int, Widget>(
   pagingController: controller.pagingController,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          builderDelegate: PagedChildBuilderDelegate<Widget>(
            itemBuilder: (context, item, index){
              return item;
            },
          ),
        ),
      ),
    );
  }
}
