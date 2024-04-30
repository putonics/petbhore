// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum PaymentMode { online, offline }

enum PaymentDirection {
  c2v,
  v2c,
}

class CustomerOrderPayment {
  //timestamp
  final int id;
  final int amount;
  final PaymentMode paymentMode;
  final PaymentDirection paymentDirection;

  CustomerOrderPayment({
    required this.id,
    required this.amount,
    required this.paymentMode,
    required this.paymentDirection,
  });

  CustomerOrderPayment copyWith({
    int? id,
    int? amount,
    PaymentMode? paymentMode,
    PaymentDirection? paymentDirection,
  }) {
    return CustomerOrderPayment(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      paymentMode: paymentMode ?? this.paymentMode,
      paymentDirection: paymentDirection ?? this.paymentDirection,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'paymentMode': paymentMode,
      'paymentDirection': paymentDirection,
    };
  }

  factory CustomerOrderPayment.fromMap(Map<String, dynamic> map) {
    return CustomerOrderPayment(
      id: map['id'] as int,
      amount: map['amount'] as int,
      paymentMode: map['paymentMode'] as PaymentMode,
      paymentDirection: map['paymentDirection'] as PaymentDirection,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerOrderPayment.fromJson(String source) =>
      CustomerOrderPayment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerOrderPayment(id: $id, amount: $amount, paymentMode: $paymentMode, paymentDirection: $paymentDirection)';
  }

  @override
  bool operator ==(covariant CustomerOrderPayment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.amount == amount &&
        other.paymentMode == paymentMode &&
        other.paymentDirection == paymentDirection;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        amount.hashCode ^
        paymentMode.hashCode ^
        paymentDirection.hashCode;
  }
}
