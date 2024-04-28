import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petbhore/cards/recent_item_card.dart';
import 'package:petbhore/controller/recent_items_provider.dart';
import 'package:petbhore/utils/helper.dart';

class RecentItems extends StatelessWidget {
  const RecentItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final recentItems = ref.watch(recentItemsProvider);
        return switch (recentItems) {
          AsyncData(:final value) => Column(
              children: [
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
                    children: value
                        .map((data) => RecentItemCard(data: data))
                        .toList(),
                  ),
                )
              ],
            ),
          AsyncError() => const Text('Oops, something unexpected happened'),
          _ => const CircularProgressIndicator(),
        };
      },
    );
  }
}
