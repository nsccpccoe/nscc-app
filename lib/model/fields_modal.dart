import 'package:flutter/material.dart';

class Fields {
  String type;
  String name;
  String? label;
  String? placeHolder;
  String? value;
  bool? mutable;
  List<dynamic>? options;
  TextEditingController controller;

  Fields({
    required this.type,
    required this.name,
    this.label,
    this.placeHolder,
    this.value,
    this.mutable,
    this.options,
    required this.controller,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        type: json["type"],
        name: json["name"],
        label: json["label"] ?? "",
        placeHolder: json["placeHolder"] ?? "",
        value: json["value"] ?? "",
        mutable: json["mutable"] ?? true,
        options: json["options"] ?? [],
        controller: TextEditingController(),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "label": label,
        "placeHolder": placeHolder,
        "value": value,
        "mutable": mutable,
        "options": options,
      };
}
