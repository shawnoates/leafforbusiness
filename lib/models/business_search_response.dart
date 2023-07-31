import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:leaf_for_business/models/business.dart';

class BusinessSearchResponse {
  final List<Business> businesses;
  final int total;
  BusinessSearchResponse({
    required this.businesses,
    required this.total,
  });

  BusinessSearchResponse copyWith({
    List<Business>? businesses,
    int? total,
  }) {
    return BusinessSearchResponse(
      businesses: businesses ?? this.businesses,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'businesses': businesses.map((x) => x.toMap()).toList(),
      'total': total,
    };
  }

  factory BusinessSearchResponse.fromMap(Map<String, dynamic> map) {
    return BusinessSearchResponse(
      businesses: List<Business>.from(
        (map['businesses'] as List).map<Business>(
          (x) => Business.fromMap(x as Map<String, dynamic>),
        ),
      ),
      total: map['total'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessSearchResponse.fromJson(String source) =>
      BusinessSearchResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BusinessSearchResponse(businesses: $businesses, total: $total)';

  @override
  bool operator ==(covariant BusinessSearchResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.businesses, businesses) && other.total == total;
  }

  @override
  int get hashCode => businesses.hashCode ^ total.hashCode;
}
