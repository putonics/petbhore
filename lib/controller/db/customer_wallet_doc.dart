// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:petbhore/controller/db/customer_wallet_payment.dart';

class CustomerWalletDoc {
  //id should be the timestamp i.e when this object is created
  final int id;
  final int balance;
  final List<CustomerWalletPayment> payments;

  CustomerWalletDoc({
    required this.id,
    required this.balance,
    required this.payments,
  });

  CustomerWalletDoc copyWith({
    int? id,
    int? balance,
    List<CustomerWalletPayment>? payments,
  }) {
    return CustomerWalletDoc(
      id: id ?? this.id,
      balance: balance ?? this.balance,
      payments: payments ?? this.payments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'balance': balance,
      'payments': payments.map((x) => x.toMap()).toList(),
    };
  }

  factory CustomerWalletDoc.fromMap(Map<String, dynamic> map) {
    return CustomerWalletDoc(
      id: map['id'] as int,
      balance: map['balance'] as int,
      payments: List<CustomerWalletPayment>.from(
        (map['payments'] as List<Map<String, dynamic>>)
            .map<CustomerWalletPayment>(
          (x) => CustomerWalletPayment.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerWalletDoc.fromJson(String source) =>
      CustomerWalletDoc.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CustomerWalletDoc(id: $id, balance: $balance, payments: $payments)';

  @override
  bool operator ==(covariant CustomerWalletDoc other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.balance == balance &&
        listEquals(other.payments, payments);
  }

  @override
  int get hashCode => id.hashCode ^ balance.hashCode ^ payments.hashCode;
}
