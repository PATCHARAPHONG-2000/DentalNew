// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pressrelease {
  final String name;
  final String image;
  final String pdf;
  Pressrelease({
    required this.name,
    required this.image,
    required this.pdf,
  });

  Pressrelease copyWith({
    String? name,
    String? image,
    String? pdf,
  }) {
    return Pressrelease(
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

  factory Pressrelease.fromMap(Map<String, dynamic> map) {
    return Pressrelease(
      name: map['name'] as String,
      image: map['image'] as String,
      pdf: map['pdf'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pressrelease.fromJson(String source) =>
      Pressrelease.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Pressrelease(name: $name, image: $image, pdf: $pdf)';

  @override
  bool operator ==(covariant Pressrelease other) {
    if (identical(this, other)) return true;

    return other.name == name && other.image == image && other.pdf == pdf;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ pdf.hashCode;
}
