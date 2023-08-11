// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ClinicFirebase {
  final String name;
  final String address;
  final String image_1;
  final String search;
  final String time;
  final String time_out;
  final String url;
  ClinicFirebase({
    required this.address,
    required this.image_1,
    required this.name,
    required this.search,
    required this.time,
    required this.time_out,
    required this.url,
  });

  ClinicFirebase copyWith({
    String? address,
    String? image,
    String? image_1,
    String? name,
    String? search,
    String? time,
    String? time_out,
    String? url,
  }) {
    return ClinicFirebase(
      address: address ?? this.address,
      image_1: image_1 ?? this.image_1,
      name: name ?? this.name,
      search: search ?? this.search,
      time: time ?? this.time,
      time_out: time_out ?? this.time_out,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'image_1': image_1,
      'name': name,
      'search': search,
      'time': time,
      'time_out': time_out,
      'url': url,
    };
  }

  factory ClinicFirebase.fromMap(Map<String, dynamic> map) {
    return ClinicFirebase(
      address: map['address'] as String,
      image_1: map['image_1'] as String,
      name: map['name'] as String,
      search: map['search'] as String,
      time: map['time'] as String,
      time_out: map['time_out'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClinicFirebase.fromJson(String source) =>
      ClinicFirebase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClinicFirebase(address: $address,  image_1: $image_1, name: $name, search: $search, time: $time, time_out: $time_out, url: $url)';
  }

  @override
  bool operator ==(covariant ClinicFirebase other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.image_1 == image_1 &&
        other.name == name &&
        other.search == search &&
        other.time == time &&
        other.time_out == time_out &&
        other.url == url;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        image_1.hashCode ^
        name.hashCode ^
        search.hashCode ^
        time.hashCode ^
        time_out.hashCode ^
        url.hashCode;
  }

  static fromSnapshot(QueryDocumentSnapshot<Object?> snapshot) {}
}
