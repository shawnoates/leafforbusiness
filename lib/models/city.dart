import 'dart:convert';

class City {
  final String city;
  final String state;
  City({
    required this.city,
    required this.state,
  });

  City copyWith({
    String? city,
    String? state,
  }) {
    return City(
      city: city ?? this.city,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'state': state,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      city: map['city'] as String,
      state: map['state'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) =>
      City.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'City(city: $city, state: $state)';

  @override
  bool operator ==(covariant City other) {
    if (identical(this, other)) return true;

    return other.city == city && other.state == state;
  }

  @override
  int get hashCode => city.hashCode ^ state.hashCode;
}
