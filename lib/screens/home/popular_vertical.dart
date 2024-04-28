import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petbhore/cards/popular_vertical_card.dart';
import 'package:petbhore/controller/popular_vertical_provider.dart';
import 'package:petbhore/utils/helper.dart';

class PopularVertical extends StatelessWidget {
  const PopularVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final categories = ref.watch(popularVerticalProvider);
        return switch (categories) {
          AsyncData(:final value) => Column(
              children: [
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
                ...value.map((data) => PopularVerticalCard(data: data)).toList()
              ],
            ),
          AsyncError() => const Text('Oops, something unexpected happened'),
          _ => const CircularProgressIndicator(),
        };
      },
    );
  }
}
