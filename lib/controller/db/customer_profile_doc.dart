// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:petbhore/controller/db/customer_address.dart';
import 'package:petbhore/controller/db/customer_wallet_payment.dart';

class CustomerProfileDoc {
  final int id;
  final int mob;
  final String name;
  final int walletBalance;
  final List<CustomerWalletPayment> payments;
  final String image;
  final CustomerAddress defaultAddress;
  final List<CustomerAddress> otherAddresses;

  CustomerProfileDoc({
    required this.id,
    required this.mob,
    required this.name,
    required this.walletBalance,
    required this.payments,
    required this.image,
    required this.defaultAddress,
    required this.otherAddresses,
  });

  CustomerProfileDoc copyWith({
    int? id,
    int? mob,
    String? name,
    int? walletBalance,
    List<CustomerWalletPayment>? payments,
    String? image,
    CustomerAddress? defaultAddress,
    List<CustomerAddress>? otherAddresses,
  }) {
    return CustomerProfileDoc(
      id: id ?? this.id,
      mob: mob ?? this.mob,
      name: name ?? this.name,
      walletBalance: walletBalance ?? this.walletBalance,
      payments: payments ?? this.payments,
      image: image ?? this.image,
      defaultAddress: defaultAddress ?? this.defaultAddress,
      otherAddresses: otherAddresses ?? this.otherAddresses,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mob': mob,
      'name': name,
      'walletBalance': walletBalance,
      'payments': payments.map((x) => x.toMap()).toList(),
      'image': image,
      'defaultAddress': defaultAddress.toMap(),
      'otherAddresses': otherAddresses.map((x) => x.toMap()).toList(),
    };
  }

  factory CustomerProfileDoc.fromMap(Map<String, dynamic> map) {
    return CustomerProfileDoc(
      id: map['id'] as int,
      mob: map['mob'] as int,
      name: map['name'] as String,
      walletBalance: map['walletBalance'] as int,
      payments: List<CustomerWalletPayment>.from(
        (map['payments'] as List<Map<String, dynamic>>)
            .map<CustomerWalletPayment>(
          (x) => CustomerWalletPayment.fromMap(x),
        ),
      ),
      image: map['image'] as String,
      defaultAddress: CustomerAddress.fromMap(
          map['defaultAddress'] as Map<String, dynamic>),
      otherAddresses: List<CustomerAddress>.from(
        (map['otherAddresses'] as List<Map<String, dynamic>>)
            .map<CustomerAddress>(
          (x) => CustomerAddress.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerProfileDoc.fromJson(String source) =>
      CustomerProfileDoc.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerProfileDoc(id: $id, mob: $mob, name: $name, walletBalance: $walletBalance, payments: $payments, image: $image, defaultAddress: $defaultAddress, otherAddresses: $otherAddresses)';
  }

  @override
  bool operator ==(covariant CustomerProfileDoc other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.mob == mob &&
        other.name == name &&
        other.walletBalance == walletBalance &&
        listEquals(other.payments, payments) &&
        other.image == image &&
        other.defaultAddress == defaultAddress &&
        listEquals(other.otherAddresses, otherAddresses);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        mob.hashCode ^
        name.hashCode ^
        walletBalance.hashCode ^
        payments.hashCode ^
        image.hashCode ^
        defaultAddress.hashCode ^
        otherAddresses.hashCode;
  }
}
