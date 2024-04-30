// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum OrderStatus {
  active,
  cancelled,
  delivered,
}

class CustomerOrderStatus {
  //timestamp
  final int id;
  final OrderStatus status;

  CustomerOrderStatus({
    required this.id,
    required this.status,
  });

  CustomerOrderStatus copyWith({
    int? id,
    OrderStatus? status,
  }) {
    return CustomerOrderStatus(
      id: id ?? this.id,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
    };
  }

  factory CustomerOrderStatus.fromMap(Map<String, dynamic> map) {
    return CustomerOrderStatus(
      id: map['id'] as int,
      status: map['status'] as OrderStatus,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerOrderStatus.fromJson(String source) =>
      CustomerOrderStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CustomerOrderStatus(id: $id, status: $status)';

  @override
  bool operator ==(covariant CustomerOrderStatus other) {
    if (identical(this, other)) return true;

    return other.id == id && other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ status.hashCode;
}
