import 'package:betwise_app/core/custom_assets/assets.gen.dart';
import 'package:betwise_app/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationControllerMain extends GetxController {
  static NavigationControllerMain get to => Get.find();

  RxInt selectedNavIndex = 0.obs;

  List<Widget> getPages() {
    return [
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
  }


  // List of icons for the navigation bar
  final List<String> icons = [
    "assets/icons/home.svg",
    "assets/icons/searchoneicon.svg",
    "assets/icons/notification.svg",
    "assets/icons/Profileicon.svg",

  ];

  // List of labels for the navigation bar
  final List<String> labels = [
    "Home",
    "Search",
    "Notification",
    "Profile",
  ];
}
