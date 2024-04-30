// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VendorDeliveryTime {
  final String title;
  final int fromHour;
  final int toHour;

  VendorDeliveryTime({
    required this.title,
    required this.fromHour,
    required this.toHour,
  });

  VendorDeliveryTime copyWith({
    String? title,
    int? fromHour,
    int? toHour,
  }) {
    return VendorDeliveryTime(
      title: title ?? this.title,
      fromHour: fromHour ?? this.fromHour,
      toHour: toHour ?? this.toHour,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'fromHour': fromHour,
      'toHour': toHour,
    };
  }

  factory VendorDeliveryTime.fromMap(Map<String, dynamic> map) {
    return VendorDeliveryTime(
      title: map['title'] as String,
      fromHour: map['fromHour'] as int,
      toHour: map['toHour'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorDeliveryTime.fromJson(String source) =>
      VendorDeliveryTime.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'VendorDeliveryTime(title: $title, fromHour: $fromHour, toHour: $toHour)';

  @override
  bool operator ==(covariant VendorDeliveryTime other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.fromHour == fromHour &&
        other.toHour == toHour;
  }

  @override
  int get hashCode => title.hashCode ^ fromHour.hashCode ^ toHour.hashCode;
}
