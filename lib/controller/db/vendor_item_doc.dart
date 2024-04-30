// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:petbhore/controller/db/vendor_delivery_time.dart';
import 'package:petbhore/controller/db/vendor_item_addon.dart';

/// Created and maintained by the vendor
class VendorItemDoc {
  //id should be the timestamp i.e when this object is created
  final int id;
  final String name;
  final List<String> images;
  //If it is adon only, then it will only be shown in the adon list; and will not be displayed at item list.
  final bool isAdonOnly;
  //The category, where the item belongs.
  final String category;
  //Is the item is a veg item.
  final bool isVeg;
  //Whether the item can be sugar free.
  final bool canSugarFree;
  //The available quantity should be specified for instant ordering, bcz  there is a chance of ending of the stock.
  final int instantOrderAvailableQty;
  //The price for the instant order should be higher than the price for the pre order.
  final int instantOrderPrice;
  //Customer will get the option of available times for preorder delivery.
  final List<VendorDeliveryTime> availableDeliveryTimes;
  //The pre order gap is the gap duration between ordering and availableDeliveryTimes in case of pre-ordering.
  final int preOrderGap;
  //The pre order price should be lesser than that of the instant order.
  final int preOrderPrice;
  //The pre order qty must have limit.
  final int maxQtyPreOrdered;
  //The items that can be addons with this item
  final List<VendorItemAddon> addons;

  VendorItemDoc({
    required this.id,
    required this.name,
    required this.images,
    required this.isAdonOnly,
    required this.category,
    required this.isVeg,
    required this.canSugarFree,
    required this.instantOrderAvailableQty,
    required this.instantOrderPrice,
    required this.availableDeliveryTimes,
    required this.preOrderGap,
    required this.preOrderPrice,
    required this.maxQtyPreOrdered,
    required this.addons,
  });

  VendorItemDoc copyWith({
    int? id,
    String? name,
    List<String>? images,
    bool? isAdonOnly,
    String? category,
    bool? isVeg,
    bool? canSugarFree,
    int? instantOrderAvailableQty,
    int? instantOrderPrice,
    List<VendorDeliveryTime>? availableDeliveryTimes,
    int? preOrderGap,
    int? preOrderPrice,
    int? maxQtyPreOrdered,
    List<VendorItemAddon>? addons,
  }) {
    return VendorItemDoc(
      id: id ?? this.id,
      name: name ?? this.name,
      images: images ?? this.images,
      isAdonOnly: isAdonOnly ?? this.isAdonOnly,
      category: category ?? this.category,
      isVeg: isVeg ?? this.isVeg,
      canSugarFree: canSugarFree ?? this.canSugarFree,
      instantOrderAvailableQty:
          instantOrderAvailableQty ?? this.instantOrderAvailableQty,
      instantOrderPrice: instantOrderPrice ?? this.instantOrderPrice,
      availableDeliveryTimes:
          availableDeliveryTimes ?? this.availableDeliveryTimes,
      preOrderGap: preOrderGap ?? this.preOrderGap,
      preOrderPrice: preOrderPrice ?? this.preOrderPrice,
      maxQtyPreOrdered: maxQtyPreOrdered ?? this.maxQtyPreOrdered,
      addons: addons ?? this.addons,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'images': images,
      'isAdonOnly': isAdonOnly,
      'category': category,
      'isVeg': isVeg,
      'canSugarFree': canSugarFree,
      'instantOrderAvailableQty': instantOrderAvailableQty,
      'instantOrderPrice': instantOrderPrice,
      'availableDeliveryTimes':
          availableDeliveryTimes.map((x) => x.toMap()).toList(),
      'preOrderGap': preOrderGap,
      'preOrderPrice': preOrderPrice,
      'maxQtyPreOrdered': maxQtyPreOrdered,
      'addons': addons.map((x) => x.toMap()).toList(),
    };
  }

  factory VendorItemDoc.fromMap(Map<String, dynamic> map) {
    return VendorItemDoc(
      id: map['id'] as int,
      name: map['name'] as String,
      images: List<String>.from((map['images'] as List<String>)),
      isAdonOnly: map['isAdonOnly'] as bool,
      category: map['category'] as String,
      isVeg: map['isVeg'] as bool,
      canSugarFree: map['canSugarFree'] as bool,
      instantOrderAvailableQty: map['instantOrderAvailableQty'] as int,
      instantOrderPrice: map['instantOrderPrice'] as int,
      availableDeliveryTimes: List<VendorDeliveryTime>.from(
        (map['availableDeliveryTimes'] as List<Map<String, dynamic>>)
            .map<VendorDeliveryTime>(
          (x) => VendorDeliveryTime.fromMap(x),
        ),
      ),
      preOrderGap: map['preOrderGap'] as int,
      preOrderPrice: map['preOrderPrice'] as int,
      maxQtyPreOrdered: map['maxQtyPreOrdered'] as int,
      addons: List<VendorItemAddon>.from(
        (map['addons'] as List<Map<String, dynamic>>).map<VendorItemAddon>(
          (x) => VendorItemAddon.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorItemDoc.fromJson(String source) =>
      VendorItemDoc.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VendorItemDoc(id: $id, name: $name, images: $images, isAdonOnly: $isAdonOnly, category: $category, isVeg: $isVeg, canSugarFree: $canSugarFree, instantOrderAvailableQty: $instantOrderAvailableQty, instantOrderPrice: $instantOrderPrice, availableDeliveryTimes: $availableDeliveryTimes, preOrderGap: $preOrderGap, preOrderPrice: $preOrderPrice, maxQtyPreOrdered: $maxQtyPreOrdered, addons: $addons)';
  }

  @override
  bool operator ==(covariant VendorItemDoc other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.images, images) &&
        other.isAdonOnly == isAdonOnly &&
        other.category == category &&
        other.isVeg == isVeg &&
        other.canSugarFree == canSugarFree &&
        other.instantOrderAvailableQty == instantOrderAvailableQty &&
        other.instantOrderPrice == instantOrderPrice &&
        listEquals(other.availableDeliveryTimes, availableDeliveryTimes) &&
        other.preOrderGap == preOrderGap &&
        other.preOrderPrice == preOrderPrice &&
        other.maxQtyPreOrdered == maxQtyPreOrdered &&
        listEquals(other.addons, addons);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        images.hashCode ^
        isAdonOnly.hashCode ^
        category.hashCode ^
        isVeg.hashCode ^
        canSugarFree.hashCode ^
        instantOrderAvailableQty.hashCode ^
        instantOrderPrice.hashCode ^
        availableDeliveryTimes.hashCode ^
        preOrderGap.hashCode ^
        preOrderPrice.hashCode ^
        maxQtyPreOrdered.hashCode ^
        addons.hashCode;
  }
}
