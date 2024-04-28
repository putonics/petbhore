// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdvertisementCardModel {
  final String image;
  final bool isNetworkImage;
  final String title;
  final String type;
  final String name;
  final double rating;
  final int ratingCount;
  final String link;

  const AdvertisementCardModel({
    required this.image,
    this.isNetworkImage = false,
    required this.title,
    this.type = "",
    this.name = "",
    this.rating = 0,
    this.ratingCount = 0,
    this.link = "",
  });

  AdvertisementCardModel copyWith({
    String? image,
    bool? isNetworkImage,
    String? title,
    String? type,
    String? name,
    double? rating,
    int? ratingCount,
    String? link,
  }) {
    return AdvertisementCardModel(
      image: image ?? this.image,
      isNetworkImage: isNetworkImage ?? this.isNetworkImage,
      title: title ?? this.title,
      type: type ?? this.type,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      ratingCount: ratingCount ?? this.ratingCount,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'isNetworkImage': isNetworkImage,
      'title': title,
      'type': type,
      'name': name,
      'rating': rating,
      'ratingCount': ratingCount,
      'link': link,
    };
  }

  factory AdvertisementCardModel.fromMap(Map<String, dynamic> map) {
    return AdvertisementCardModel(
      image: (map['image'] ?? "") as String,
      isNetworkImage: (map['isNetworkImage'] ?? false) as bool,
      title: (map['title'] ?? "") as String,
      type: (map['type'] ?? "") as String,
      name: (map['name'] ?? "") as String,
      rating: (map['rating'] ?? 0.0) as double,
      ratingCount: (map['ratingCount'] ?? 0) as int,
      link: (map['link'] ?? "") as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdvertisementCardModel.fromJson(String source) =>
      AdvertisementCardModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdvertisementCardModel(image: $image, isNetworkImage: $isNetworkImage, title: $title, type: $type, name: $name, rating: $rating, ratingCount: $ratingCount, link: $link)';
  }

  @override
  bool operator ==(covariant AdvertisementCardModel other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.isNetworkImage == isNetworkImage &&
        other.title == title &&
        other.type == type &&
        other.name == name &&
        other.rating == rating &&
        other.ratingCount == ratingCount &&
        other.link == link;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        isNetworkImage.hashCode ^
        title.hashCode ^
        type.hashCode ^
        name.hashCode ^
        rating.hashCode ^
        ratingCount.hashCode ^
        link.hashCode;
  }
}
