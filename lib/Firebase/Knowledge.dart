// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewKnowledg {
  final String name;
  final String image;
  final String pdf;
  NewKnowledg({
    required this.name,
    required this.image,
    required this.pdf,
  });

  NewKnowledg copyWith({
    String? name,
    String? image,
    String? pdf,
  }) {
    return NewKnowledg(
      name: name ?? this.name,
      image: image ?? this.image,
      pdf: pdf ?? this.pdf,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'pdf': pdf,
    };
  }

  factory NewKnowledg.fromMap(Map<String, dynamic> map) {
    return NewKnowledg(
      name: map['name'] as String,
      image: map['image'] as String,
      pdf: map['pdf'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewKnowledg.fromJson(String source) =>
      NewKnowledg.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NewKnowledg(name: $name, image: $image, pdf: $pdf)';

  @override
  bool operator ==(covariant NewKnowledg other) {
    if (identical(this, other)) return true;

    return other.name == name && other.image == image && other.pdf == pdf;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ pdf.hashCode;
}
