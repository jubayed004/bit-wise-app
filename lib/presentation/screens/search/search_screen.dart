import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/core/custom_assets/assets.gen.dart';
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
      endDrawer: SearchDrawer(),
      body: RefreshIndicator(
        onRefresh: () async{
          //controller.pagingController.refresh();
        },
        child: CustomScrollView(
          slivers: [
            SliverGap(44),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14,),
                child: Column(
                  children: [
                    Row(
                      children: [
          /*              GestureDetector(
                          onTap: (){
                            AppRouter.route.pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              border: Border.all(
                                color: Colors.black,
                                width: 1
                              ),
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: IconButton(onPressed: (){}, icon: Center(child: Icon(Icons.arrow_back_ios_new_rounded))),
                          ),
                        ),
                        Gap(6),*/
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: CupertinoSearchTextField(
                              ///padding: EdgeInsets.only(left: 8),
                              controller: controller.searchController,
                              onSubmitted: (value){
                                controller.search.value = value;
                                controller.pagingController.refresh();
                              },
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(Iconsax.search_favorite, color: AppColors.blackColor,),
                              ),
                              placeholder: "Chicago Bulls vs Brooklyn Nets",
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1
                                ),
                                  color: Colors.green.shade50,
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
                                color: Colors.green.shade50,
                              border: Border.all(
                                color: Colors.black,
                                width: 1
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Assets.icons.filltericon.svg(),
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
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: PagedSliverList<int,Widget>(
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Widget>(
                    itemBuilder: (context, item, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 16, top: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10), // Rounded corners for cards
                          border: Border.all(color: AppColors.greenColor.withOpacity(0.4), width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              spreadRadius: 0,
                              offset: Offset(1, 2), // Subtle shadow effect
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12), // Add some padding inside the card
                          child: item,
                        ),
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
