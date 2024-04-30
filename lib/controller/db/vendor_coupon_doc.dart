// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

///Created and maintained by the vendor
class VendorCouponDoc {
  //id should be the timestamp i.e when this object is created. This id will be shown as hex-coupon-code.
  final int id;
  //Image of the coupon that can be displayed on the app.
  final String img;
  //Applied on specific customer; when 0 applied on everyone.
  final int customerId;
  //Applied on specific item; when 0 applied on every items.
  final int itemId;
  //Minimum gross-price to achieve this coupon.
  final int minGrossPrice;
  //The timestamp of start availing this coupon.
  final int startAt;
  //The timestamp of end availing this coupon.
  final int endAt;
  //The amount to be discounted.
  final int discount;
  //Whenever this document is modified.
  final int modifiedOn;

  VendorCouponDoc({
    required this.id,
    required this.img,
    required this.customerId,
    required this.itemId,
    required this.minGrossPrice,
    required this.startAt,
    required this.endAt,
    required this.discount,
    required this.modifiedOn,
  });

  VendorCouponDoc copyWith({
    int? id,
    String? img,
    int? customerId,
    int? itemId,
    int? minGrossPrice,
    int? startAt,
    int? endAt,
    int? discount,
    int? modifiedOn,
  }) {
    return VendorCouponDoc(
      id: id ?? this.id,
      img: img ?? this.img,
      customerId: customerId ?? this.customerId,
      itemId: itemId ?? this.itemId,
      minGrossPrice: minGrossPrice ?? this.minGrossPrice,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      discount: discount ?? this.discount,
      modifiedOn: modifiedOn ?? this.modifiedOn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'img': img,
      'customerId': customerId,
      'itemId': itemId,
      'minGrossPrice': minGrossPrice,
      'startAt': startAt,
      'endAt': endAt,
      'discount': discount,
      'modifiedOn': modifiedOn,
    };
  }

  factory VendorCouponDoc.fromMap(Map<String, dynamic> map) {
    return VendorCouponDoc(
      id: map['id'] as int,
      img: map['img'] as String,
      customerId: map['customerId'] as int,
      itemId: map['itemId'] as int,
      minGrossPrice: map['minGrossPrice'] as int,
      startAt: map['startAt'] as int,
      endAt: map['endAt'] as int,
      discount: map['discount'] as int,
      modifiedOn: map['modifiedOn'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorCouponDoc.fromJson(String source) =>
      VendorCouponDoc.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VendorCouponDoc(id: $id, img: $img, customerId: $customerId, itemId: $itemId, minGrossPrice: $minGrossPrice, startAt: $startAt, endAt: $endAt, discount: $discount, modifiedOn: $modifiedOn)';
  }

  @override
  bool operator ==(covariant VendorCouponDoc other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.img == img &&
        other.customerId == customerId &&
        other.itemId == itemId &&
        other.minGrossPrice == minGrossPrice &&
        other.startAt == startAt &&
        other.endAt == endAt &&
        other.discount == discount &&
        other.modifiedOn == modifiedOn;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        img.hashCode ^
        customerId.hashCode ^
        itemId.hashCode ^
        minGrossPrice.hashCode ^
        startAt.hashCode ^
        endAt.hashCode ^
        discount.hashCode ^
        modifiedOn.hashCode;
  }
}
