import 'dart:convert';

class AddonModel {
  final String itemId;
  //The default checked status of the add-on.
  final bool isChecked;
  //If true, then the checked status of the add-on must be true and cannont be unchecked ever.
  final bool isFixed;

  AddonModel({
    required this.itemId,
    required this.isChecked,
    required this.isFixed,
  });

  AddonModel copyWith({
    String? itemId,
    bool? isChecked,
    bool? isFixed,
  }) {
    return AddonModel(
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

  factory AddonModel.fromMap(Map<String, dynamic> map) {
    return AddonModel(
      itemId: map['itemId'] as String,
      isChecked: map['isChecked'] as bool,
      isFixed: map['isFixed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddonModel.fromJson(String source) =>
      AddonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AddonModel(itemId: $itemId, isChecked: $isChecked, isFixed: $isFixed)';

  @override
  bool operator ==(covariant AddonModel other) {
    if (identical(this, other)) return true;

    return other.itemId == itemId &&
        other.isChecked == isChecked &&
        other.isFixed == isFixed;
  }

  @override
  int get hashCode => itemId.hashCode ^ isChecked.hashCode ^ isFixed.hashCode;
}
