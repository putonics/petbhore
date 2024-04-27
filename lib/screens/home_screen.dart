import 'package:flutter/material.dart';
import 'package:petbhore/cards/category_card.dart';
import 'package:petbhore/cards/most_popular_card.dart';
import 'package:petbhore/cards/recent_item_card.dart';
import 'package:petbhore/cards/restaurant_card.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_nav_bar.dart';
import 'package:petbhore/widgets/search_barx.dart';
import 'individual_item.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Good morning Akila!",
                          style: Helper.getTheme(context).headlineSmall,
                        ),
                        Image.asset(Helper.getAssetName("cart.png", "virtual"))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text("Deilivering to"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: SizedBox(
                        width: 250,
                        child: DropdownButton(
                          value: "current location",
                          items: const [
                            DropdownMenuItem(
                              value: "current location",
                              child: Text("Current Location"),
                            ),
                          ],
                          icon: Image.asset(
                            Helper.getAssetName(
                                "dropdown_filled.png", "virtual"),
                          ),
                          style: Helper.getTheme(context).headlineMedium,
                          onChanged: (_) {},
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SearchBarx(title: "Search Food"),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryCard(
                            image: Image.asset(
                              Helper.getAssetName("hamburger2.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Offers",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CategoryCard(
                            image: Image.asset(
                              Helper.getAssetName("rice2.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Sri Lankan",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CategoryCard(
                            image: Image.asset(
                              Helper.getAssetName("fruit.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Italian",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CategoryCard(
                            image: Image.asset(
                              Helper.getAssetName("rice.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Indian",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Restaurants",
                          style: Helper.getTheme(context).headlineSmall,
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text("View all"))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RestaurantCard(
                    image: Image.asset(
                      Helper.getAssetName("pizza2.jpg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Minute by tuk tuk",
                  ),
                  RestaurantCard(
                    image: Image.asset(
                      Helper.getAssetName("breakfast.jpg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Cafe de Noir",
                  ),
                  RestaurantCard(
                    image: Image.asset(
                      Helper.getAssetName("bakery.jpg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Bakes by Tella",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Most Popular",
                          style: Helper.getTheme(context).headlineSmall,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("View all"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          MostPopularCard(
                            image: Image.asset(
                              Helper.getAssetName("pizza4.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Cafe De Bambaa",
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          MostPopularCard(
                            name: "Burger by Bella",
                            image: Image.asset(
                              Helper.getAssetName("dessert3.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Items",
                          style: Helper.getTheme(context).headlineSmall,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("View all"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(IndividualItem.routeName);
                          },
                          child: RecentItemCard(
                            image: Image.asset(
                              Helper.getAssetName("pizza3.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Veg Thali",
                          ),
                        ),
                        RecentItemCard(
                            image: Image.asset(
                              Helper.getAssetName("coffee.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Barita"),
                        RecentItemCard(
                            image: Image.asset(
                              Helper.getAssetName("pizza.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Pizza Rush Hour"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
              bottom: 0,
              left: 0,
              child: CustomNavBar(
                home: true,
              )),
        ],
      ),
    );
  }
}
