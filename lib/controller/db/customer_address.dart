// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomerAddress {
  final String title;
  final double lat;
  final double long;
  final String address;

  CustomerAddress({
    required this.title,
    required this.lat,
    required this.long,
    required this.address,
  });

  CustomerAddress copyWith({
    String? title,
    double? lat,
    double? long,
    String? address,
  }) {
    return CustomerAddress(
      title: title ?? this.title,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'lat': lat,
      'long': long,
      'address': address,
    };
  }

  factory CustomerAddress.fromMap(Map<String, dynamic> map) {
    return CustomerAddress(
      title: map['title'] as String,
      lat: map['lat'] as double,
      long: map['long'] as double,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerAddress.fromJson(String source) =>
      CustomerAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerAddress(title: $title, lat: $lat, long: $long, address: $address)';
  }

  @override
  bool operator ==(covariant CustomerAddress other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.lat == lat &&
        other.long == long &&
        other.address == address;
  }

  @override
  int get hashCode {
    return title.hashCode ^ lat.hashCode ^ long.hashCode ^ address.hashCode;
  }
}
