// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:petbhore/controller/db/customer_order_coupon.dart';
import 'package:petbhore/controller/db/customer_order_item.dart';
import 'package:petbhore/controller/db/customer_order_payment.dart';
import 'package:petbhore/controller/db/customer_order_status.dart';
import 'package:petbhore/controller/db/vendor_delivery_time.dart';

///Created and modified by customer
class CustomerOrderDoc {
  //id should be the timestamp i.e when this object is created
  final int id;
  final List<CustomerOrderItem> items;
  //Customer will select the deliveryTime when orders.
  final VendorDeliveryTime deliveryTime;
  final CustomerOrderCouponDoc coupon;
  final int gst;
  final int netPayableAmount;
  final int customerId;
  final int addressId;
  //A customer can change the order status multiple time; thus stored in a list.
  final List<CustomerOrderStatus> statuses;
  //The last status of the above list; help to segregate the orders by status.
  final OrderStatus presentStatus;
  //A the payment can be done multiple time; thus stored in a list.
  //Chnage in payment will automatically invoke GCF that will insert a record inside PaymentTransactionDoc.
  final List<CustomerOrderPayment> payments;
  //This will keep track on las c2v payment; help to segregate orders by payment status.
  final int c2vPayedAmount;

  CustomerOrderDoc({
    required this.id,
    required this.items,
    required this.deliveryTime,
    required this.coupon,
    required this.gst,
    required this.netPayableAmount,
    required this.customerId,
    required this.addressId,
    required this.statuses,
    required this.presentStatus,
    required this.payments,
    required this.c2vPayedAmount,
  });

  CustomerOrderDoc copyWith({
    int? id,
    List<CustomerOrderItem>? items,
    VendorDeliveryTime? deliveryTime,
    CustomerOrderCouponDoc? coupon,
    int? gst,
    int? netPayableAmount,
    int? customerId,
    int? addressId,
    List<CustomerOrderStatus>? statuses,
    OrderStatus? presentStatus,
    List<CustomerOrderPayment>? payments,
    int? c2vPayedAmount,
  }) {
    return CustomerOrderDoc(
      id: id ?? this.id,
      items: items ?? this.items,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      coupon: coupon ?? this.coupon,
      gst: gst ?? this.gst,
      netPayableAmount: netPayableAmount ?? this.netPayableAmount,
      customerId: customerId ?? this.customerId,
      addressId: addressId ?? this.addressId,
      statuses: statuses ?? this.statuses,
      presentStatus: presentStatus ?? this.presentStatus,
      payments: payments ?? this.payments,
      c2vPayedAmount: c2vPayedAmount ?? this.c2vPayedAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'items': items.map((x) => x.toMap()).toList(),
      'deliveryTime': deliveryTime.toMap(),
      'coupon': coupon.toMap(),
      'gst': gst,
      'netPayableAmount': netPayableAmount,
      'customerId': customerId,
      'addressId': addressId,
      'statuses': statuses.map((x) => x.toMap()).toList(),
      'presentStatus': presentStatus,
      'payments': payments.map((x) => x.toMap()).toList(),
      'c2vPayedAmount': c2vPayedAmount,
    };
  }

  factory CustomerOrderDoc.fromMap(Map<String, dynamic> map) {
    return CustomerOrderDoc(
      id: map['id'] as int,
      items: List<CustomerOrderItem>.from(
        (map['items'] as List<Map<String, dynamic>>).map<CustomerOrderItem>(
          (x) => CustomerOrderItem.fromMap(x),
        ),
      ),
      deliveryTime: VendorDeliveryTime.fromMap(
          map['deliveryTime'] as Map<String, dynamic>),
      coupon:
          CustomerOrderCouponDoc.fromMap(map['coupon'] as Map<String, dynamic>),
      gst: map['gst'] as int,
      netPayableAmount: map['netPayableAmount'] as int,
      customerId: map['customerId'] as int,
      addressId: map['addressId'] as int,
      statuses: List<CustomerOrderStatus>.from(
        (map['statuses'] as List<Map<String, dynamic>>)
            .map<CustomerOrderStatus>(
          (x) => CustomerOrderStatus.fromMap(x),
        ),
      ),
      presentStatus: map['presentStatus'] as OrderStatus,
      payments: List<CustomerOrderPayment>.from(
        (map['payments'] as List<Map<String, dynamic>>)
            .map<CustomerOrderPayment>(
          (x) => CustomerOrderPayment.fromMap(x),
        ),
      ),
      c2vPayedAmount: map['c2vPayedAmount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerOrderDoc.fromJson(String source) =>
      CustomerOrderDoc.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerOrderDoc(id: $id, items: $items, deliveryTime: $deliveryTime, coupon: $coupon, gst: $gst, netPayableAmount: $netPayableAmount, customerId: $customerId, addressId: $addressId, statuses: $statuses, presentStatus: $presentStatus, payments: $payments, c2vPayedAmount: $c2vPayedAmount)';
  }

  @override
  bool operator ==(covariant CustomerOrderDoc other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.items, items) &&
        other.deliveryTime == deliveryTime &&
        other.coupon == coupon &&
        other.gst == gst &&
        other.netPayableAmount == netPayableAmount &&
        other.customerId == customerId &&
        other.addressId == addressId &&
        listEquals(other.statuses, statuses) &&
        other.presentStatus == presentStatus &&
        listEquals(other.payments, payments) &&
        other.c2vPayedAmount == c2vPayedAmount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        items.hashCode ^
        deliveryTime.hashCode ^
        coupon.hashCode ^
        gst.hashCode ^
        netPayableAmount.hashCode ^
        customerId.hashCode ^
        addressId.hashCode ^
        statuses.hashCode ^
        presentStatus.hashCode ^
        payments.hashCode ^
        c2vPayedAmount.hashCode;
  }
}
