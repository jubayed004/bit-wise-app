
import 'package:betwise_app/core/dependency/get_it_injection.dart';
import 'package:betwise_app/helper/toast_message/toast_message.dart';
import 'package:betwise_app/presentation/screens/notify/model/notify_model.dart';
import 'package:betwise_app/service/api_service.dart';
import 'package:betwise_app/service/api_url.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NotifyController extends GetxController {
  final ApiClient apiClient = serviceLocator();

  final PagingController<int, Result> pagingController = PagingController(firstPageKey: 1);

  RxBool isLoadingMove = false.obs;

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      getNotifications(pageKey);
    });
  }

  Future<void> getNotifications(int pageKey) async {
    if (isLoadingMove.value) return;
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
    }
  }


  Future<void> deleteNotification( String id) async {
    try {
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
    }
  }




  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
