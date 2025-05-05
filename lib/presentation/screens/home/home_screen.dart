import 'package:betwise_app/controller/get_controllers.dart';
import 'package:betwise_app/core/route/route_path.dart';
import 'package:betwise_app/core/route/routes.dart';
import 'package:betwise_app/presentation/screens/no_internet/error_card.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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

 // final navController = GetControllers.instance.getNavController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Column(
        children: [
          // Static Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 50, // Set your desired height here
              padding: EdgeInsets.symmetric(horizontal: 12), // Optional: Add horizontal padding if needed
              decoration: BoxDecoration(
                color: Color(0xFFF0FDF4), // Background color
                borderRadius: BorderRadius.circular(5), // Rounded corners
                border: Border.all(color: Colors.black, width: 1), // Border color and width
              ),
              child: CupertinoSearchTextField(
                placeholder: "cigars_shop",
                prefixIcon: Icon(Iconsax.search_favorite, color: AppColors.blackColor),
                decoration: BoxDecoration(
                  color: Colors.transparent, // Make the search field background transparent (handled by the container)
                ),
              ),
            )

          ),
          // Static List (just static items for now)
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              itemCount: 10, // Example: Static 10 items
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item #$index'), // Static text
                );
              },
            ),
          ),
        ],
      ),



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


