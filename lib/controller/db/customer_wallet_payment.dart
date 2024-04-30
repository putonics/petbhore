// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomerWalletPayment {
  final int id;
  final int amount;
  final String purpose;

  CustomerWalletPayment({
    required this.id,
    required this.amount,
    required this.purpose,
  });

  CustomerWalletPayment copyWith({
    int? id,
    int? amount,
    String? purpose,
  }) {
    return CustomerWalletPayment(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      purpose: purpose ?? this.purpose,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'purpose': purpose,
    };
  }

  factory CustomerWalletPayment.fromMap(Map<String, dynamic> map) {
    return CustomerWalletPayment(
      id: map['id'] as int,
      amount: map['amount'] as int,
      purpose: map['purpose'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerWalletPayment.fromJson(String source) =>
      CustomerWalletPayment.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CustomerWalletPayment(id: $id, amount: $amount, purpose: $purpose)';

  @override
  bool operator ==(covariant CustomerWalletPayment other) {
    if (identical(this, other)) return true;

    return other.id == id && other.amount == amount && other.purpose == purpose;
  }

  @override
  int get hashCode => id.hashCode ^ amount.hashCode ^ purpose.hashCode;
}
