import 'package:flutter/material.dart';
import 'package:petbhore/controller/advertisement_card_model.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/utils/helper.dart';

class RecentItemCard extends StatelessWidget {
  final AdvertisementCardModel data;
  const RecentItemCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          data.link == "" ? null : Navigator.of(context).pushNamed(data.link),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 80,
              height: 80,
              child: data.isNetworkImage
                  ? Image.network(data.image, fit: BoxFit.cover)
                  : Image.asset(data.image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            color: AppColor.themeColor,
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
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${data.rating}",
                        style: const TextStyle(
                          color: AppColor.themeColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('(${data.ratingCount}) Ratings')
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
