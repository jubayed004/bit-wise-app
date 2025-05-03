


import 'package:betwise_app/presentation/screens/auth/controller/auth_controller.dart';
import 'package:betwise_app/presentation/screens/home/controller/home_controller.dart';
import 'package:betwise_app/presentation/screens/onboarding/controller/onboarding_controller.dart';
import 'package:betwise_app/presentation/screens/other/controller/other_controller.dart';
import 'package:betwise_app/presentation/screens/profile/controller/profile_controller.dart';
import 'package:betwise_app/presentation/screens/search/controller/search_screen_controller.dart';
import 'package:get/get.dart';


class GetControllers {
  static final GetControllers _singleton = GetControllers._internal();

  GetControllers._internal();

  static GetControllers get instance => _singleton;

/*
  LanguageController getLanguageController() {
    if (!Get.isRegistered<LanguageController>()) {
      Get.put(LanguageController(),permanent: true);
    }
    return Get.find<LanguageController>();
  }*/

  AuthController getAuthController() {
    if (!Get.isRegistered<AuthController>()) {
      Get.put(AuthController());
    }
    return Get.find<AuthController>();
  }
  OnboardingController getOnboardingController() {
    if (!Get.isRegistered<OnboardingController>()) {
      Get.put(OnboardingController());
    }
    return Get.find<OnboardingController>();
  }
/*
  NavController getNavController() {
    if (!Get.isRegistered<NavController>()) {
      Get.put(NavController());
    }
    return Get.find<NavController>();
  }*/

  OtherController getOtherController() {
    if (!Get.isRegistered<OtherController>()) {
      Get.put(OtherController());
    }
    return Get.find<OtherController>();
  }


  ProfileController getProfileController() {
    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }
    return Get.find<ProfileController>();
  }

  HomeController getHomeController() {
    if (!Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    }
    return Get.find<HomeController>();
  }

  SearchScreenController getSearchScreenController() {
    if (!Get.isRegistered<SearchScreenController>()) {
      Get.put(SearchScreenController());
    }
    return Get.find<SearchScreenController>();
  }


/*  CategoriesController getCountryCityModel() {
    if (!Get.isRegistered<CategoriesController>()) {
      Get.put(CategoriesController());
    }
    return Get.find<CategoriesController>();
  }*/
}
