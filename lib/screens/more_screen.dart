import 'package:flutter/material.dart';
import 'package:petbhore/cards/more_card.dart';
import 'package:petbhore/data/images.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_nav_bar.dart';

import 'about_screen.dart';
import 'inbox_screen.dart';
import 'my_order_screen.dart';
import 'notification_screen.dart';
import 'payment_screen.dart';

class MoreScreen extends StatelessWidget {
  static const routeName = "/moreScreen";

  const MoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "More",
                        style: Helper.getTheme(context).headlineSmall,
                      ),
                      Image.asset(IconImage.cart),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MoreCard(
                    image: Image.asset(IconImage.income),
                    name: "Payment Details",
                    handler: () {
                      Navigator.of(context).pushNamed(PaymentScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MoreCard(
                    image: Image.asset(IconImage.shoppingBag),
                    name: "My Orders",
                    handler: () {
                      Navigator.of(context).pushNamed(MyOrderScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MoreCard(
                    image: Image.asset(IconImage.notification),
                    name: "Notifications",
                    isNoti: true,
                    handler: () {
                      Navigator.of(context)
                          .pushNamed(NotificationScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MoreCard(
                    image: Image.asset(IconImage.mail),
                    name: "Inbox",
                    handler: () {
                      Navigator.of(context).pushNamed(InboxScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MoreCard(
                    image: Image.asset(IconImage.info),
                    name: "About Us",
                    handler: () {
                      Navigator.of(context).pushNamed(AboutScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(),
          )
        ],
      ),
    );
  }
}
