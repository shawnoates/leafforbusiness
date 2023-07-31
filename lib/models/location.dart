import 'dart:convert';

import 'package:flutter/foundation.dart';

class Location {
  final String address1;
  final String? address2;
  final String? address3;
  final String city;
  final String zipCode;
  final String country;
  final String state;
  final List<String> displayAddress;
  Location({
    required this.address1,
    this.address2,
    this.address3,
    required this.city,
    required this.zipCode,
    required this.country,
    required this.state,
    required this.displayAddress,
  });

  Location copyWith({
    String? address1,
    String? address2,
    String? address3,
    String? city,
    String? zipCode,
    String? country,
    String? state,
    List<String>? displayAddress,
  }) {
    return Location(
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      address3: address3 ?? this.address3,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      state: state ?? this.state,
      displayAddress: displayAddress ?? this.displayAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address1': address1,
      'address2': address2,
      'address3': address3,
      'city': city,
      'zip_code': zipCode,
      'country': country,
      'state': state,
      'display_address': displayAddress,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      address1: map['address1'] as String,
      address2: map['address2'] != null ? map['address2'] as String : null,
      address3: map['address3'] != null ? map['address3'] as String : null,
      city: map['city'] as String,
      zipCode: map['zip_code'] as String,
      country: map['country'] as String,
      state: map['state'] as String,
      displayAddress: List<String>.from(map['display_address'] as List),
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Location(address1: $address1, address2: $address2, address3: $address3, city: $city, zipCode: $zipCode, country: $country, state: $state, displayAddress: $displayAddress)';
  }

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.address1 == address1 &&
        other.address2 == address2 &&
        other.address3 == address3 &&
        other.city == city &&
        other.zipCode == zipCode &&
        other.country == country &&
        other.state == state &&
        listEquals(other.displayAddress, displayAddress);
  }

  @override
  int get hashCode {
    return address1.hashCode ^
        address2.hashCode ^
        address3.hashCode ^
        city.hashCode ^
        zipCode.hashCode ^
        country.hashCode ^
        state.hashCode ^
        displayAddress.hashCode;
  }
}
