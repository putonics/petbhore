import 'package:flutter/material.dart';
import 'package:petbhore/controller/advertisement_card_model.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/data/images.dart';
import 'package:petbhore/utils/helper.dart';

class PopularHorizontalCard extends StatelessWidget {
  const PopularHorizontalCard({
    super.key,
    required this.data,
  });

  final AdvertisementCardModel data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          data.link == "" ? null : Navigator.of(context).pushNamed(data.link),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 300,
                height: 200,
                child: data.isNetworkImage
                    ? Image.network(data.image, fit: BoxFit.cover)
                    : Image.asset(data.image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              data.title,
              style: Helper.getTheme(context)
                  .headlineMedium
                  ?.copyWith(color: AppColor.primary),
            ),
            Row(
              children: [
                Text(data.type),
                const SizedBox(
                  width: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    ".",
                    style: TextStyle(
                      color: AppColor.orange,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(data.name),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(IconImage.starFilled),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${data.rating}",
                  style: const TextStyle(
                    color: AppColor.orange,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
