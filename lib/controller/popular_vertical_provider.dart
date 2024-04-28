import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petbhore/controller/advertisement_card_model.dart';
import 'package:petbhore/data/fake_data.dart';

final popularVerticalProvider = FutureProvider.autoDispose((ref) async {
  return fakeRestaurants.map((e) => AdvertisementCardModel.fromMap(e));
});
