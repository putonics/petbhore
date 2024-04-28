import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/controller/advertisement_card_model.dart';
import 'package:petbhore/utils/helper.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
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
        width: 120,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 100,
                height: 100,
                child: data.isNetworkImage
                    ? Image.network(
                        data.image,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        data.image,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              data.title,
              style: Helper.getTheme(context)
                  .headlineMedium
                  ?.copyWith(color: AppColor.primary, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
