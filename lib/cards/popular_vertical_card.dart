import 'package:flutter/material.dart';
import 'package:petbhore/controller/advertisement_card_model.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/utils/helper.dart';

class PopularVerticalCard extends StatelessWidget {
  const PopularVerticalCard({
    super.key,
    required this.data,
  });

  final AdvertisementCardModel data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          data.link == "" ? null : Navigator.of(context).pushNamed(data.link),
      child: SizedBox(
        height: 270,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: data.isNetworkImage
                  ? Image.network(data.image, fit: BoxFit.cover)
                  : Image.asset(data.image, fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        data.title,
                        style: Helper.getTheme(context).displaySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${data.rating}",
                        style: const TextStyle(color: AppColor.themeColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("(${data.ratingCount} ratings)"),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(data.type),
                      const SizedBox(
                        width: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          ".",
                          style: TextStyle(
                            color: AppColor.themeColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(data.name),
                    ],
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
