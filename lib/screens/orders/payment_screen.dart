import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_nav_bar.dart';
import 'package:petbhore/widgets/custom_text_input.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = "/paymentScreen";

  const PaymentScreen({super.key});
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Payment Details",
                          style: Helper.getTheme(context).headlineSmall,
                        ),
                      ),
                      const Icon(Icons.shopping_cart),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Text(
                        "Customize your payment method",
                        style: Helper.getTheme(context).displaySmall,
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: DataColors.placeholder,
                    thickness: 1.5,
                    height: 30,
                  ),
                ),
                Container(
                  height: 180,
                  width: Helper.getScreenWidth(context),
                  decoration: BoxDecoration(
                    color: DataColors.placeholderBg,
                    boxShadow: [
                      BoxShadow(
                        color: DataColors.placeholder.withOpacity(0.5),
                        offset: const Offset(0, 20),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cash/Card on delivery",
                              style: TextStyle(
                                  color: DataColors.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.check,
                              color: DataColors.themeColor,
                            )
                          ],
                        ),
                        const Divider(
                          color: DataColors.placeholder,
                          thickness: 1,
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40,
                              child: Image.asset(
                                Helper.getAssetName("visa.png", "real"),
                              ),
                            ),
                            const Text("**** ****"),
                            const Text("2187"),
                            OutlinedButton(
                              style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    const BorderSide(
                                      color: DataColors.themeColor,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    const StadiumBorder(),
                                  ),
                                  foregroundColor: MaterialStateProperty.all(
                                      DataColors.themeColor)),
                              onPressed: () {},
                              child: const Text("Delete Card"),
                            )
                          ],
                        ),
                        const Divider(
                          color: DataColors.placeholder,
                          thickness: 1,
                          height: 20,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Other Methods",
                              style: TextStyle(
                                  color: DataColors.primary,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            isScrollControlled: true,
                            isDismissible: false,
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: Helper.getScreenHeight(context) * 0.7,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                            Icons.clear,
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Add Credit/Debit Card",
                                            style: Helper.getTheme(context)
                                                .displaySmall,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Divider(
                                        color: DataColors.placeholder
                                            .withOpacity(0.5),
                                        thickness: 1.5,
                                        height: 40,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: CustomTextInput(
                                          hintText: "card Number"),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Expiry"),
                                          SizedBox(
                                            height: 50,
                                            width: 100,
                                            child: CustomTextInput(
                                              hintText: "MM",
                                              padding:
                                                  EdgeInsets.only(left: 35),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: 100,
                                            child: CustomTextInput(
                                              hintText: "YY",
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: CustomTextInput(
                                          hintText: "Security Code"),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: CustomTextInput(
                                          hintText: "First Name"),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: CustomTextInput(
                                          hintText: "Last Name"),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                              "You can remove this card"),
                                          Switch(
                                            value: false,
                                            onChanged: (_) {},
                                            thumbColor:
                                                MaterialStateProperty.all(
                                              DataColors.secondary,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: SizedBox(
                                        height: 50,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                ),
                                                SizedBox(width: 40),
                                                Text("Add Card"),
                                                SizedBox(width: 40),
                                              ],
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          Text("Add Another Credit/Debit Card"),
                        ],
                      )),
                )
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(),
          ),
        ],
      ),
    );
  }
}
