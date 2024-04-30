import 'dart:convert';
import 'package:flutter/foundation.dart';

class CustomerOrderItem {
  final int id;
  final String name;
  final String image;
  final String category;
  final bool isVeg;
  final bool isSugarFree;
  final int price;
  final int preOrderDiscount;
  final int qty;
  final List<CustomerOrderItem> addons;

  CustomerOrderItem({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.isVeg,
    required this.isSugarFree,
    required this.price,
    required this.preOrderDiscount,
    required this.qty,
    required this.addons,
  });

  CustomerOrderItem copyWith({
    int? id,
    String? name,
    String? image,
    String? category,
    bool? isVeg,
    bool? isSugarFree,
    int? price,
    int? preOrderDiscount,
    int? qty,
    List<CustomerOrderItem>? addons,
  }) {
    return CustomerOrderItem(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      category: category ?? this.category,
      isVeg: isVeg ?? this.isVeg,
      isSugarFree: isSugarFree ?? this.isSugarFree,
      price: price ?? this.price,
      preOrderDiscount: preOrderDiscount ?? this.preOrderDiscount,
      qty: qty ?? this.qty,
      addons: addons ?? this.addons,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'category': category,
      'isVeg': isVeg,
      'isSugarFree': isSugarFree,
      'price': price,
      'preOrderDiscount': preOrderDiscount,
      'qty': qty,
      'addons': addons.map((x) => x.toMap()).toList(),
    };
  }

  factory CustomerOrderItem.fromMap(Map<String, dynamic> map) {
    return CustomerOrderItem(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      category: map['category'] as String,
      isVeg: map['isVeg'] as bool,
      isSugarFree: map['isSugarFree'] as bool,
      price: map['price'] as int,
      preOrderDiscount: map['preOrderDiscount'] as int,
      qty: map['qty'] as int,
      addons: List<CustomerOrderItem>.from(
        (map['addons'] as List<Map<String, dynamic>>).map<CustomerOrderItem>(
          (x) => CustomerOrderItem.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerOrderItem.fromJson(String source) =>
      CustomerOrderItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerOrderItem(id: $id, name: $name, image: $image, category: $category, isVeg: $isVeg, isSugarFree: $isSugarFree, price: $price, preOrderDiscount: $preOrderDiscount, qty: $qty, addons: $addons)';
  }

  @override
  bool operator ==(covariant CustomerOrderItem other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.category == category &&
        other.isVeg == isVeg &&
        other.isSugarFree == isSugarFree &&
        other.price == price &&
        other.preOrderDiscount == preOrderDiscount &&
        other.qty == qty &&
        listEquals(other.addons, addons);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        category.hashCode ^
        isVeg.hashCode ^
        isSugarFree.hashCode ^
        price.hashCode ^
        preOrderDiscount.hashCode ^
        qty.hashCode ^
        addons.hashCode;
  }
}
