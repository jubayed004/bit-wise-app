
import 'package:betwise_app/core/custom_assets/assets.gen.dart';
import 'package:betwise_app/core/dependency/get_it_injection.dart';
import 'package:betwise_app/helper/toast_message/toast_message.dart';
import 'package:betwise_app/presentation/components/custom_image/custom_image.dart';
import 'package:betwise_app/presentation/components/custom_text/custom_text.dart';
import 'package:betwise_app/presentation/screens/notify/model/notify_model.dart';
import 'package:betwise_app/service/api_service.dart';
import 'package:betwise_app/service/api_url.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NotifyController extends GetxController {
  final ApiClient apiClient = serviceLocator();

  final PagingController<int, Widget> pagingController = PagingController(firstPageKey: 1);

  RxBool isLoadingMove = false.obs;

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      getNotifications(pageKey);
    });
  }

List<Widget> notifyList =[
  Container(
     margin: EdgeInsets.only(bottom: 8),
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
  Container(
      margin: EdgeInsets.only(bottom: 8),
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
  Container(
      margin: EdgeInsets.only(bottom: 8),
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
];


  Future<void> getNotifications(int pageKey) async {
    pagingController.appendLastPage(notifyList);
  //  pagingController.appendLastPage();
/*    if (isLoadingMove.value) return;
    isLoadingMove.value = true;

    try {
      final response = await apiClient.get(url: ApiUrl.getNotification( pageKey: pageKey));

      if (response.statusCode == 200) {
        final NotificationModel notificationModel = NotificationModel.fromJson(response.body);

        final newItems = notificationModel.data?.result ?? [];

        final isLastPage = newItems.length < pageKey;

        if (isLastPage) {
          pagingController.appendLastPage(newItems);
        } else {
          pagingController.appendPage(newItems, pageKey + 1);
        }
      } else {
        pagingController.error = 'Failed to load notifications';
      }
    } catch (e) {
      pagingController.error = 'Something went wrong';
    } finally {
      isLoadingMove.value = false;
    }*/
  }


  Future<void> deleteNotification( String id) async {
/*    try {
      final response = await apiClient.delete(
        url: ApiUrl.deleteNotification( id: id), body: {},
      );

      if (response.statusCode == 200) {
          pagingController.refresh();
        toastMessage(message: "Notification deleted successfully");
      } else {
        toastMessage(message: "Failed to delete notification");
      }
    } catch (e) {
      toastMessage(message: "Something went wrong");
    }*/
  }




  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
