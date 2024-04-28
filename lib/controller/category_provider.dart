import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petbhore/controller/advertisement_card_model.dart';
import 'package:petbhore/data/fake_data.dart';

final categoryProvider = FutureProvider.autoDispose((ref) async {
  return fakeCategories.map((e) => AdvertisementCardModel.fromMap(e));
});
