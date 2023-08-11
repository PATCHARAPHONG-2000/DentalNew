// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TestData {
  final String name;
  TestData({
    required this.name,
  });

  TestData copyWith({
    String? name,
  }) {
    return TestData(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory TestData.fromMap(Map<String, dynamic> map) {
    return TestData(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TestData.fromJson(String source) =>
      TestData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TestData(name: $name)';

  @override
  bool operator ==(covariant TestData other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
