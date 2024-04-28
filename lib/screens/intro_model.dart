// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:petbhore/data/images.dart';

class IntroModel {
  final String image;
  final String title;
  final String desc;

  const IntroModel({
    required this.image,
    required this.title,
    required this.desc,
  });

  static bool isNetworkImage = false;

  static List<IntroModel> data = [
    IntroModel(
        image: AppImage.introImages[0],
        title: "Find Food You Love",
        desc:
            "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep"),
    IntroModel(
        image: AppImage.introImages[1],
        title: "Fast Delivery",
        desc: "Fast food delivery to your home, office wherever you are"),
    IntroModel(
        image: AppImage.introImages[2],
        title: "Live Tracking",
        desc:
            "Real time tracking of your food on the app once you placed the order"),
  ];
}
