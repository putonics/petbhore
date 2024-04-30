import 'dart:convert';

class VendorItemAddon {
  final String itemId;
  //The default checked status of the add-on.
  final bool isChecked;
  //If true, then the checked status of the add-on must be true and cannont be unchecked ever.
  final bool isFixed;

  VendorItemAddon({
    required this.itemId,
    required this.isChecked,
    required this.isFixed,
  });

  VendorItemAddon copyWith({
    String? itemId,
    bool? isChecked,
    bool? isFixed,
  }) {
    return VendorItemAddon(
      itemId: itemId ?? this.itemId,
      isChecked: isChecked ?? this.isChecked,
      isFixed: isFixed ?? this.isFixed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemId': itemId,
      'isChecked': isChecked,
      'isFixed': isFixed,
    };
  }

  factory VendorItemAddon.fromMap(Map<String, dynamic> map) {
    return VendorItemAddon(
      itemId: map['itemId'] as String,
      isChecked: map['isChecked'] as bool,
      isFixed: map['isFixed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorItemAddon.fromJson(String source) =>
      VendorItemAddon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'VendorItemAddon(itemId: $itemId, isChecked: $isChecked, isFixed: $isFixed)';

  @override
  bool operator ==(covariant VendorItemAddon other) {
    if (identical(this, other)) return true;

    return other.itemId == itemId &&
        other.isChecked == isChecked &&
        other.isFixed == isFixed;
  }

  @override
  int get hashCode => itemId.hashCode ^ isChecked.hashCode ^ isFixed.hashCode;
}
