import 'dart:convert';

class Category {
  final String alias;
  final String title;
  Category({
    required this.alias,
    required this.title,
  });

  Category copyWith({
    String? alias,
    String? title,
  }) {
    return Category(
      alias: alias ?? this.alias,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'alias': alias,
      'title': title,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      alias: map['alias'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category(alias: $alias, title: $title)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.alias == alias && other.title == title;
  }

  @override
  int get hashCode => alias.hashCode ^ title.hashCode;
}
