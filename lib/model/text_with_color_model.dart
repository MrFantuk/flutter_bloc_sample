import 'dart:convert';

import 'package:flutter/material.dart';

class TextColorModel {
  final String title;
  final Color? color;

  TextColorModel({
    required this.title,
    this.color,
  });

  TextColorModel copyWith({
    String? title,
    Color? color,
  }) {
    return TextColorModel(
      title: title ?? this.title,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'color': color?.value,
    };
  }

  factory TextColorModel.fromMap(Map<String, dynamic> map) {
    return TextColorModel(
      title: map['title'] ?? '',
      color: map['color'] != null ? Color(map['color']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TextColorModel.fromJson(String source) => TextColorModel.fromMap(json.decode(source));

  @override
  String toString() => 'TextColorModel(title: $title, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TextColorModel &&
      other.title == title &&
      other.color == color;
  }

  @override
  int get hashCode => title.hashCode ^ color.hashCode;
}
                  