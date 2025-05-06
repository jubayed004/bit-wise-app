import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/core/custom_assets/assets.gen.dart';
import 'package:betwise_app/core/route/route_path.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/presentation/components/custom_text/custom_text.dart';
import 'package:betwise_app/presentation/screens/no_internet/error_card.dart';
import 'package:betwise_app/presentation/widget/custom_post_betwise/custom_post_betwise.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'model/home_model.dart';
import 'widget/home_app_bar.dart';
import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/core/custom_assets/assets.gen.dart';
import 'package:betwise_app/core/route/route_path.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/helper/image/network_image.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:betwise_app/utils/app_const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = GetControllers.instance.getHomeController();
  final _controller = GetControllers.instance.getProfileController();


 // final navController = GetControllers.instance.getNavController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(),
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true, // Keeps the AppBar visible at the top when scrolling up
            floating: true, // The AppBar will float back up when you scroll up
            snap: true, // Makes the AppBar snap back when scrolling up
         // Height when expanded
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Container(
                      height: 50, // Set your desired height here
                      padding: EdgeInsets.symmetric(horizontal: 16), // Optional padding
                      decoration: BoxDecoration(
                        color: Color(0xFFF0FDF4), // Background color
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                        border: Border.all(color: Colors.black.withOpacity(0.3), width: 1), // Border styling
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 8,
                            spreadRadius: 1,
                            offset: Offset(2, 2), // Subtle shadow for a lifted effect
                          ),
                        ],
                      ),
                      child: CupertinoSearchTextField(
                        placeholder: "Search Here",
                        prefixIcon: Icon(Iconsax.search_favorite, color: AppColors.blackColor),
                        decoration: BoxDecoration(
                          color: Colors.transparent, // Transparent background
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Your other list or content goes here
          SliverFillRemaining(
            child: RefreshIndicator(
              onRefresh: () async {
                controller.pagingController.refresh();
              },
              child: PagedListView<int, Widget>(
                pagingController: controller.pagingController,
                padding: EdgeInsets.symmetric(horizontal: 16),
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
                    return Center(
                      child: ErrorCard(
                        onTap: () => controller.pagingController.refresh(),
                        text: controller.pagingController.error.toString(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),


      /* body: Column(
        children: [
          // Static Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 50, // Set your desired height here
              padding: EdgeInsets.symmetric(horizontal: 12), // Optional: Add horizontal padding if needed
              decoration: BoxDecoration(
                color: Color(0xFFF0FDF4), // Background color
                borderRadius: BorderRadius.circular(6), // Rounded corners
                border: Border.all(color: Colors.black, width: 1), // Border color and width
              ),
              child: CupertinoSearchTextField(
                placeholder: "Click Here to Search",
                prefixIcon: Icon(Iconsax.search_favorite, color: AppColors.blackColor),
                decoration: BoxDecoration(
                  color: Colors.transparent, // Make the search field background transparent (handled by the container)
                ),
              ),
            )

          ),
          // Static List (just static items for now)
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async{
                controller.pagingController.refresh();
              },
              child: PagedListView<int, Widget>(
                pagingController: controller.pagingController,
                padding: EdgeInsets.symmetric(horizontal: 12),
                builderDelegate: PagedChildBuilderDelegate<Widget>(
                    itemBuilder: (context, item, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20,top: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: AppColors.greenColor.withValues(alpha: 0.4),width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 24,
                                spreadRadius: 0,
                                offset: Offset(1, 1),
                                blurStyle: BlurStyle.normal,
                              ),
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
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
          ),
        ],
      ),*/



      /*PagedListView<int, String>(
        pagingController: controller.pagingController,
        padding: EdgeInsets.symmetric(horizontal: 12),
        builderDelegate: PagedChildBuilderDelegate<String>(
            itemBuilder: (context, item, index) {
              return Column(
                children: [
                  CupertinoSearchTextField(
                    controller: controller.searchController,
                    onSubmitted: (value){
                      controller.searchController.value ;

                    },
                    prefixIcon: Icon(Iconsax.search_favorite, color: AppColors.blackColor,),
                    placeholder: "cigars_shop",
                    decoration: BoxDecoration(
                      color: Color(0xFFE9EFFD),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),

                ],
              );
            },
            firstPageErrorIndicatorBuilder: (context) {
              return Center(child: ErrorCard(onTap: () => controller.pagingController.refresh(), text: controller.pagingController.error));
            }
        ),
      ),*/

      /*RefreshIndicator(
        onRefresh: () async{
       //controller.refresh();
        },
        child:
      ),*/
    );
  }
}


