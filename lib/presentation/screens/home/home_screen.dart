/*
import 'package:betwise_app/core/route/route_path.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/presentation/screens/no_internet/error_card.dart';
import 'package:betwise_app/presentation/widget/card/store_card.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:cigar/controller/get_controllers.dart';
import 'package:cigar/core/custom_assets/assets.gen.dart';
import 'package:cigar/core/route/route_path.dart';
import 'package:cigar/core/route/routes.dart';
import 'package:cigar/helper/image/network_image.dart';
import 'package:cigar/presentation/screens/no_internet/error_card.dart';
import 'package:cigar/presentation/widget/card/store_card.dart';

import 'package:cigar/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'model/home_model.dart';
import 'widget/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = GetControllers.instance.getHomeController();
  final categoryController = GetControllers.instance.getCategoriesController();
  final navController = GetControllers.instance.getNavController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: HomeAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          navController.selectedIndex.value = 2;
        },
        backgroundColor: AppColors.primaryColor,
       // child: Assets.icons.add.svg(),
      ),
      body: RefreshIndicator(
        onRefresh: () async{
       controller.pagingController.refresh();
        },
        child: PagedListView<int, PlaceItem>(
          pagingController: controller.pagingController,
          padding: EdgeInsets.symmetric(horizontal: 12),
          builderDelegate: PagedChildBuilderDelegate<PlaceItem>(
              itemBuilder: (context, item, index) {
                return StoreCard(
                  onTap: (){
                    AppRouter.route.pushNamed(RoutePath.projectDetailsScreen, extra: item.id);
                  }, result: item,
                );
              },
              firstPageErrorIndicatorBuilder: (context) {
                return Center(child: ErrorCard(onTap: () => controller.pagingController.refresh(), text: controller.pagingController.error));
              }
          ),
        ),
      ),
    );
  }
}


*/
