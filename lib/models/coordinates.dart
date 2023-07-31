import 'dart:convert';

class Coordinates {
  final double latitude;
  final double longitude;
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  Coordinates copyWith({
    double? latitude,
    double? longitude,
  }) {
    return Coordinates(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinates.fromJson(String source) =>
      Coordinates.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Coordinates(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(covariant Coordinates other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
