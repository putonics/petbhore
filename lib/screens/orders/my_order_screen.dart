import 'package:flutter/material.dart';
import 'package:petbhore/cards/burger_card.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_nav_bar.dart';
import 'checkout_screen.dart';

class MyOrderScreen extends StatelessWidget {
  static const routeName = "/myOrderScreen";

  const MyOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            Row(
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
                    "My Order",
                    style: Helper.getTheme(context).headlineSmall,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 90,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.asset(
                          Helper.getAssetName("hamburger.jpg", "real"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "King Burgers",
                          style: Helper.getTheme(context).displaySmall,
                        ),
                        const Row(
                          children: [
                            Icon(Icons.star),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "4.9",
                              style: TextStyle(
                                color: AppColor.themeColor,
                              ),
                            ),
                            Text(" (124 ratings)"),
                          ],
                        ),
                        const Row(
                          children: [
                            Text("Burger"),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 5,
                              ),
                              child: Text(
                                ".",
                                style: TextStyle(
                                  color: AppColor.themeColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text("Western Food"),
                          ],
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              height: 15,
                              child: Icon(Icons.location_pin),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("No 03, 4th Lane, Newyork")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              color: AppColor.placeholderBg,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    BurgerCard(
                      price: "16",
                      name: "Beef Burger",
                    ),
                    BurgerCard(
                      price: "14",
                      name: "Classic Burger",
                    ),
                    BurgerCard(
                      price: "17",
                      name: "Cheese Chicken Burger",
                    ),
                    BurgerCard(
                      price: "15",
                      name: "Chicken Legs Basket",
                    ),
                    BurgerCard(
                      price: "6",
                      name: "French Fries Large",
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColor.placeholder.withOpacity(0.25),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Delivery Instruction",
                            style: Helper.getTheme(context).displaySmall,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: AppColor.themeColor,
                                ),
                                Text(
                                  "Add Notes",
                                  style: TextStyle(
                                    color: AppColor.themeColor,
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Sub Total",
                          style: Helper.getTheme(context).displaySmall,
                        ),
                      ),
                      Text(
                        "\$68",
                        style: Helper.getTheme(context).displaySmall?.copyWith(
                              color: AppColor.themeColor,
                            ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Delivery Cost",
                          style: Helper.getTheme(context).displaySmall,
                        ),
                      ),
                      Text(
                        "\$2",
                        style: Helper.getTheme(context).displaySmall?.copyWith(
                              color: AppColor.themeColor,
                            ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: AppColor.placeholder.withOpacity(0.25),
                    thickness: 1.5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Total",
                          style: Helper.getTheme(context).displaySmall,
                        ),
                      ),
                      Text(
                        "\$70",
                        style: Helper.getTheme(context).displaySmall?.copyWith(
                              color: AppColor.themeColor,
                              fontSize: 22,
                            ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(CheckoutScreen.routeName);
                      },
                      child: const Text("Checkout"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
