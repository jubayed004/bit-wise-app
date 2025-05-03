import 'package:betwise_app/core/custom_assets/assets.gen.dart';

class UnbordingModel {
  String image;
  String title;
  String details;

  UnbordingModel({required this.image, required this.title, required this.details});
}

List<UnbordingModel> contents = [

  UnbordingModel(
      image:"assets/icons/onb1.svg",
      title:"Welcome to Bet Wise Easy Money Picks!",
      details:  "Your journey to smarter sports betting starts here. Follow top cappers, get winning tips, and stay ahead!",
  ),

  UnbordingModel(
      image: "assets/icons/onb2.svg",
      title: "Follow Trusted Cappers",
      details: "Subscribe to expert bettors, access their premium picks, and increase your winning chances!",
  ),

  UnbordingModel(
      image: "assets/icons/onb3.svg",
      title: "Get Real-Time Winning Tips",
      details:  "Stay notified with instant betting predictions, updates, and game-day insights, wherever you are.",
  ),
];