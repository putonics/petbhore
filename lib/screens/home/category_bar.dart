import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petbhore/cards/category_card.dart';
import 'package:petbhore/controller/category_provider.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final categories = ref.watch(categoryProvider);
        return switch (categories) {
          AsyncData(:final value) => Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        value.map((data) => CategoryCard(data: data)).toList(),
                  )),
            ),
          AsyncError() => const Text('Oops, something unexpected happened'),
          _ => const CircularProgressIndicator(),
        };
      },
    );
  }
}
