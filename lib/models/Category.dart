// To parse this JSON data, do
//
//     final vCategory = vCategoryFromJson(jsonString);

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

VCategory vCategoryFromJson(String str) => VCategory.fromJson(json.decode(str));

String vCategoryToJson(VCategory data) => json.encode(data.toJson());

class VCategory {
    VCategory({
        required this.value,
        required this.title,
        required this.photo,
        required this.name,
        required this.color,
    });

    int value;
    String title;
    String photo;
    String name;
    Color color;

    factory VCategory.fromJson(Map<String, dynamic> json) => VCategory(
        value: json["value"],
        title: json["title"],
        photo: json["photo"],
        name: json["name"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "title": title,
        "photo": photo,
        "name": name,
        "color": color,
    };
}
