// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

///Created and maintained by the vendor
class CustomerOrderCouponDoc {
  final int id;
  final int minPurchaseAmount;
  final int startAt;
  final int endAt;
  final int discount;

  CustomerOrderCouponDoc({
    required this.id,
    required this.minPurchaseAmount,
    required this.startAt,
    required this.endAt,
    required this.discount,
  });

  CustomerOrderCouponDoc copyWith({
    int? id,
    int? minPurchaseAmount,
    int? startAt,
    int? endAt,
    int? discount,
  }) {
    return CustomerOrderCouponDoc(
      id: id ?? this.id,
      minPurchaseAmount: minPurchaseAmount ?? this.minPurchaseAmount,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      discount: discount ?? this.discount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'minPurchaseAmount': minPurchaseAmount,
      'startAt': startAt,
      'endAt': endAt,
      'discount': discount,
    };
  }

  factory CustomerOrderCouponDoc.fromMap(Map<String, dynamic> map) {
    return CustomerOrderCouponDoc(
      id: map['id'] as int,
      minPurchaseAmount: map['minPurchaseAmount'] as int,
      startAt: map['startAt'] as int,
      endAt: map['endAt'] as int,
      discount: map['discount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerOrderCouponDoc.fromJson(String source) =>
      CustomerOrderCouponDoc.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerOrderCouponDoc(id: $id, minPurchaseAmount: $minPurchaseAmount, startAt: $startAt, endAt: $endAt, discount: $discount)';
  }

  @override
  bool operator ==(covariant CustomerOrderCouponDoc other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.minPurchaseAmount == minPurchaseAmount &&
        other.startAt == startAt &&
        other.endAt == endAt &&
        other.discount == discount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        minPurchaseAmount.hashCode ^
        startAt.hashCode ^
        endAt.hashCode ^
        discount.hashCode;
  }
}
