import 'package:shadow_clip/shadow_clip.dart';
import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_nav_bar.dart';

class IndividualItem extends StatelessWidget {
  static const routeName = "/individualScreen";

  const IndividualItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: Helper.getScreenHeight(context) * 0.5,
                          width: Helper.getScreenWidth(context),
                          child: Image.asset(
                            Helper.getAssetName("pizza3.jpg", "real"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: Helper.getScreenHeight(context) * 0.5,
                          width: Helper.getScreenWidth(context),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [0.0, 0.4],
                              colors: [
                                Colors.black.withOpacity(0.9),
                                Colors.black.withOpacity(0.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                Image.asset(
                                  Helper.getAssetName(
                                      "cart_white.png", "virtual"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Helper.getScreenHeight(context) * 0.35,
                          ),
                          SizedBox(
                            height: 800,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Container(
                                    height: 700,
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    decoration: const ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            "Tandoori Chicken Pizza",
                                            style: Helper.getTheme(context)
                                                .headlineSmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        Helper.getAssetName(
                                                            "star_filled.png",
                                                            "virtual"),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Image.asset(
                                                        Helper.getAssetName(
                                                            "star_filled.png",
                                                            "virtual"),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Image.asset(
                                                        Helper.getAssetName(
                                                            "star_filled.png",
                                                            "virtual"),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Image.asset(
                                                        Helper.getAssetName(
                                                            "star_filled.png",
                                                            "virtual"),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Image.asset(
                                                        Helper.getAssetName(
                                                            "star.png",
                                                            "virtual"),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text(
                                                    "4 Star Ratings",
                                                    style: TextStyle(
                                                      color: AppColor.orange,
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "Rs. 750",
                                                      style: TextStyle(
                                                        color: AppColor.primary,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text("/per Portion")
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            "Description",
                                            style: Helper.getTheme(context)
                                                .headlineMedium
                                                ?.copyWith(
                                                  fontSize: 16,
                                                ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada"),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Divider(
                                            color: AppColor.placeholder,
                                            thickness: 1.5,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            "Customize your Order",
                                            style: Helper.getTheme(context)
                                                .headlineMedium
                                                ?.copyWith(
                                                  fontSize: 16,
                                                ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Container(
                                            height: 50,
                                            width: double.infinity,
                                            padding: const EdgeInsets.only(
                                                left: 30, right: 10),
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              color: AppColor.placeholderBg,
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                hint: const Row(
                                                  children: [
                                                    Text(
                                                        "-Select the size of portion-"),
                                                  ],
                                                ),
                                                value: "default",
                                                onChanged: (_) {},
                                                items: const [
                                                  DropdownMenuItem(
                                                    value: "default",
                                                    child: Text(
                                                        "-Select the size of portion-"),
                                                  ),
                                                ],
                                                icon: Image.asset(
                                                  Helper.getAssetName(
                                                    "dropdown.png",
                                                    "virtual",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Container(
                                            height: 50,
                                            width: double.infinity,
                                            padding: const EdgeInsets.only(
                                                left: 30, right: 10),
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              color: AppColor.placeholderBg,
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                hint: const Row(
                                                  children: [
                                                    Text(
                                                        "-Select the ingredients-"),
                                                  ],
                                                ),
                                                value: "default",
                                                onChanged: (_) {},
                                                items: const [
                                                  DropdownMenuItem(
                                                    value: "default",
                                                    child: Text(
                                                        "-Select the ingredients-"),
                                                  ),
                                                ],
                                                icon: Image.asset(
                                                  Helper.getAssetName(
                                                    "dropdown.png",
                                                    "virtual",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Number of Portions",
                                                style: Helper.getTheme(context)
                                                    .headlineMedium
                                                    ?.copyWith(
                                                      fontSize: 16,
                                                    ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                          elevation:
                                                              MaterialStateProperty
                                                                  .all(5.0)),
                                                      onPressed: () {},
                                                      child: const Text("-"),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      height: 35,
                                                      width: 55,
                                                      decoration:
                                                          const ShapeDecoration(
                                                        shape: StadiumBorder(
                                                          side: BorderSide(
                                                              color: AppColor
                                                                  .orange),
                                                        ),
                                                      ),
                                                      child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "2",
                                                            style: TextStyle(
                                                              color: AppColor
                                                                  .orange,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                          elevation:
                                                              MaterialStateProperty
                                                                  .all(5.0)),
                                                      onPressed: () {},
                                                      child: const Text("+"),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 200,
                                          width: double.infinity,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 120,
                                                decoration:
                                                    const ShapeDecoration(
                                                  color: AppColor.orange,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(40),
                                                      bottomRight:
                                                          Radius.circular(40),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 20,
                                                  ),
                                                  child: Container(
                                                    height: 160,
                                                    width: double.infinity,
                                                    margin:
                                                        const EdgeInsets.only(
                                                      left: 50,
                                                      right: 40,
                                                    ),
                                                    decoration: ShapeDecoration(
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  40),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  40),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      shadows: [
                                                        BoxShadow(
                                                          color: AppColor
                                                              .placeholder
                                                              .withOpacity(0.3),
                                                          offset: const Offset(
                                                              0, 5),
                                                          blurRadius: 5,
                                                        ),
                                                      ],
                                                      color: Colors.white,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          "Total Price",
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(
                                                          "LKR 1500",
                                                          style: TextStyle(
                                                            color: AppColor
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        SizedBox(
                                                          width: 200,
                                                          child: ElevatedButton(
                                                              onPressed: () {},
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Image.asset(
                                                                    Helper.getAssetName(
                                                                        "add_to_cart.png",
                                                                        "virtual"),
                                                                  ),
                                                                  const Text(
                                                                    "Add to Cart",
                                                                  )
                                                                ],
                                                              )),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 20,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.white,
                                                      shadows: [
                                                        BoxShadow(
                                                          color: AppColor
                                                              .placeholder
                                                              .withOpacity(0.3),
                                                          offset: const Offset(
                                                              0, 5),
                                                          blurRadius: 5,
                                                        ),
                                                      ],
                                                      shape:
                                                          const CircleBorder(),
                                                    ),
                                                    child: Image.asset(
                                                      Helper.getAssetName(
                                                          "cart_filled.png",
                                                          "virtual"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20,
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: ClipShadow(
                                      clipper: CustomTriangle(),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: AppColor.placeholder,
                                          offset: Offset(0, 5),
                                          blurRadius: 5,
                                        ),
                                      ],
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                        child: Image.asset(
                                          Helper.getAssetName(
                                            "fav_filled.png",
                                            "virtual",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
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

class CustomTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlpoint = Offset(size.width * 0, size.height * 0.5);
    Offset endpoint = Offset(size.width * 0.2, size.height * 0.85);
    Offset controlpoint2 = Offset(size.width * 0.33, size.height);
    Offset endpoint2 = Offset(size.width * 0.6, size.height * 0.9);
    Offset controlpoint3 = Offset(size.width * 1.4, size.height * 0.5);
    Offset endpoint3 = Offset(size.width * 0.6, size.height * 0.1);
    Offset controlpoint4 = Offset(size.width * 0.33, size.height * 0);
    Offset endpoint4 = Offset(size.width * 0.2, size.height * 0.15);

    Path path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.15)
      ..quadraticBezierTo(
        controlpoint.dx,
        controlpoint.dy,
        endpoint.dx,
        endpoint.dy,
      )
      ..quadraticBezierTo(
        controlpoint2.dx,
        controlpoint2.dy,
        endpoint2.dx,
        endpoint2.dy,
      )
      ..quadraticBezierTo(
        controlpoint3.dx,
        controlpoint3.dy,
        endpoint3.dx,
        endpoint3.dy,
      )
      ..quadraticBezierTo(
        controlpoint4.dx,
        controlpoint4.dy,
        endpoint4.dx,
        endpoint4.dy,
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
