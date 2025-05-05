import 'package:betwise_app/presentation/screens/subscription/widgets/custom_tabbar.dart';
import 'package:betwise_app/presentation/screens/subscription/widgets/subscription_plan_view.dart';
import 'package:betwise_app/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TabPair {
  final Tab tab;
  final Widget view;
  TabPair({required this.tab, required this.view});
}

// TabPairs to hold tabs and their respective views
List<TabPair> tabPairs = [
  TabPair(
    tab: const Tab(
      text: 'Bronze',
    ),
    view: const SubscriptionPlanView(planName: 'Monthly', price: 50, text: 'Popular', color: Color(0xFF2D6AEC), containerColor: Color(0xFFDBEAFE),),
  ),
  TabPair(
    tab: const Tab(
      text: 'Silver',
    ),
    view: const SubscriptionPlanView(planName: 'Yearly', price: 70, text: 'Save 20%', color: Colors.black, containerColor: Color(0xFFAFF9BA),),
  ),
  TabPair(
    tab: const Tab(
      text: 'Gold',
    ),
    view: const SubscriptionPlanView(planName: 'Yearly', price: 100, text: 'Save 20%', color: Colors.black, containerColor: Color(0xFFAFF9BA),),
  )
];

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabPairs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(  // Making the entire body scrollable
          child: Padding(
            padding: const EdgeInsets.only(top: 56.0, left: 14, right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Heading and description at the top
                Column(
                  children: [
                    Text(
                      "Choose Your Subscription Plan",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    Gap(10),
                    Text(
                      "Get the best features to grow your business!",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14,color: AppColors.secondTextColor),
                      textAlign: TextAlign.center,
                    ),
                    Gap(24),
                    Custom_Tabbar(tabController: _tabController),
                    Gap(24),
                  ],
                ),
                // TabBarView is now inside a scrollable area
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2, // You can adjust the size here
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: tabPairs.map((tabPair) => tabPair.view).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}


