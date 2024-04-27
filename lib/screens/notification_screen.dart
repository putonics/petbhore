import 'package:flutter/material.dart';
import 'package:petbhore/cards/noti_card.dart';
import 'package:petbhore/const/colors.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_nav_bar.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "/notiScreen";

  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Notifications",
                        style: Helper.getTheme(context).headlineSmall,
                      ),
                    ),
                    Image.asset(
                      Helper.getAssetName("cart.png", "virtual"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const NotiCard(
                title: "Your order has been picked up",
                time: "Now",
              ),
              const NotiCard(
                title: "Your order has been delivered",
                time: "1 h ago",
                color: AppColor.placeholderBg,
              ),
              const NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "3 h ago",
              ),
              const NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "5 h ago",
              ),
              const NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "05 Sep 2020",
                color: AppColor.placeholderBg,
              ),
              const NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "12 Aug 2020",
                color: AppColor.placeholderBg,
              ),
              const NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "20 Jul 2020",
              ),
              const NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "12 Jul 2020",
              ),
            ],
          )),
          const Positioned(
              bottom: 0,
              left: 0,
              child: CustomNavBar(
                menu: true,
              ))
        ],
      ),
    );
  }
}
