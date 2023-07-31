import 'dart:convert';

import 'package:flutter/foundation.dart' as foundation;
import 'package:leaf_for_business/models/category.dart';
import 'package:leaf_for_business/models/coordinates.dart';
import 'package:leaf_for_business/models/location.dart';

class Business {
  final String id;
  final String alias;
  final String name;
  final String imageUrl;
  final bool isClosed;
  final String url;
  final int reviewCount;
  final List<Category> categories;
  final double? ratings;
  final Coordinates coordinates;
  final List transactions;
  final String? price;
  final Location location;
  final String phone;
  final String displayPhone;
  final double distance;
  Business({
    required this.id,
    required this.alias,
    required this.name,
    required this.imageUrl,
    required this.isClosed,
    required this.url,
    required this.reviewCount,
    required this.categories,
    this.ratings,
    required this.coordinates,
    required this.transactions,
    this.price,
    required this.location,
    required this.phone,
    required this.displayPhone,
    required this.distance,
  });

  Business copyWith({
    String? id,
    String? alias,
    String? name,
    String? imageUrl,
    bool? isClosed,
    String? url,
    int? reviewCount,
    List<Category>? categories,
    double? ratings,
    Coordinates? coordinates,
    List? transactions,
    String? price,
    Location? location,
    String? phone,
    String? displayPhone,
    double? distance,
  }) {
    return Business(
      id: id ?? this.id,
      alias: alias ?? this.alias,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      isClosed: isClosed ?? this.isClosed,
      url: url ?? this.url,
      reviewCount: reviewCount ?? this.reviewCount,
      categories: categories ?? this.categories,
      ratings: ratings ?? this.ratings,
      coordinates: coordinates ?? this.coordinates,
      transactions: transactions ?? this.transactions,
      price: price ?? this.price,
      location: location ?? this.location,
      phone: phone ?? this.phone,
      displayPhone: displayPhone ?? this.displayPhone,
      distance: distance ?? this.distance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'alias': alias,
      'name': name,
      'image_url': imageUrl,
      'is_closed': isClosed,
      'url': url,
      'review_count': reviewCount,
      'categories': categories.map((x) => x.toMap()).toList(),
      'ratings': ratings,
      'coordinates': coordinates.toMap(),
      'transactions': transactions,
      'price': price,
      'location': location.toMap(),
      'phone': phone,
      'display_phone': displayPhone,
      'distance': distance,
    };
  }

  factory Business.fromMap(Map<String, dynamic> map) {
    return Business(
      id: map['id'] as String,
      alias: map['alias'] as String,
      name: map['name'] as String,
      imageUrl: map['image_url'] as String,
      isClosed: map['is_closed'] as bool,
      url: map['url'] as String,
      reviewCount: map['review_count'] as int,
      categories: List<Category>.from(
        (map['categories'] as List).map<Category>(
          (x) => Category.fromMap(x as Map<String, dynamic>),
        ),
      ),
      ratings: map['ratings'] != null
          ? double.parse(map['ratings'].toString())
          : null,
      coordinates:
          Coordinates.fromMap(map['coordinates'] as Map<String, dynamic>),
      transactions: List.from(map['transactions'] as List),
      price: map['price'] != null ? map['price'] as String : null,
      location: Location.fromMap(map['location'] as Map<String, dynamic>),
      phone: map['phone'] as String,
      displayPhone: map['display_phone'] as String,
      distance: map['distance'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Business.fromJson(String source) =>
      Business.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Business(id: $id, alias: $alias, name: $name, imageUrl: $imageUrl, isClosed: $isClosed, url: $url, reviewCount: $reviewCount, categories: $categories, ratings: $ratings, coordinates: $coordinates, transactions: $transactions, price: $price, location: $location, phone: $phone, displayPhone: $displayPhone, distance: $distance)';
  }

  @override
  bool operator ==(covariant Business other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.alias == alias &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.isClosed == isClosed &&
        other.url == url &&
        other.reviewCount == reviewCount &&
        foundation.listEquals(other.categories, categories) &&
        other.ratings == ratings &&
        other.coordinates == coordinates &&
        foundation.listEquals(other.transactions, transactions) &&
        other.price == price &&
        other.location == location &&
        other.phone == phone &&
        other.displayPhone == displayPhone &&
        other.distance == distance;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        alias.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        isClosed.hashCode ^
        url.hashCode ^
        reviewCount.hashCode ^
        categories.hashCode ^
        ratings.hashCode ^
        coordinates.hashCode ^
        transactions.hashCode ^
        price.hashCode ^
        location.hashCode ^
        phone.hashCode ^
        displayPhone.hashCode ^
        distance.hashCode;
  }
}
