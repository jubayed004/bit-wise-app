/*
import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/core/route/route_path.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/presentation/screens/home/model/home_model.dart';
import 'package:betwise_app/presentation/screens/no_internet/error_card.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'widget/search_drawer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = GetControllers.instance.getSearchScreenController();
  final _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("browse_a_place".tr),
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(),
        ],
      ),
      endDrawer: SearchDrawer(),
      body: RefreshIndicator(
        onRefresh: () async{
          controller.pagingController.refresh();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: CupertinoSearchTextField(
                              controller: controller.searchController,
                              onSubmitted: (value){
                                controller.search.value = value;
                                controller.pagingController.refresh();
                              },
                              prefixIcon: Icon(Iconsax.search_favorite, color: AppColors.blackColor,),
                              placeholder: "cigars_shop".tr,
                              decoration: BoxDecoration(
                                color: Color(0xFFE9EFFD),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        Gap(8),
                        GestureDetector(
                          onTap: (){
                            controller.search.value = "";
                            controller.searchController.clear();
                            _scaffoldState.currentState?.openEndDrawer();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFFE9EFFD),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            //child: Assets.icons.filter.svg(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverGap(12),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              sliver: PagedSliverList<int,PlaceItem>(
                pagingController: controller.pagingController,
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
          ],
        ),
      ),
    );
  }
}
*/
