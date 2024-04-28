import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petbhore/cards/popular_horizontal_card.dart';
import 'package:petbhore/controller/popular_horizontal_provider.dart';
import 'package:petbhore/utils/helper.dart';

class PopularHorizontal extends StatelessWidget {
  const PopularHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final popular = ref.watch(popularHorizontalProvider);
        return switch (popular) {
          AsyncData(:final value) => Column(
              children: [
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
                  height: 300,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: value
                          .map((data) => PopularHorizontalCard(data: data))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          AsyncError() => const Text('Oops, something unexpected happened'),
          _ => const CircularProgressIndicator(),
        };
      },
    );
  }
}
