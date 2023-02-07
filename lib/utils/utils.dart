import 'package:flutter/material.dart';
import 'package:nscc_app/constants/text_field.dart';
import 'package:nscc_app/model/fields_modal.dart';
import 'package:nscc_app/widgets/drop_down.dart';

Widget getInputField(Fields field) {
  bool? isReadOnly = false;
  if (field.mutable == false) {
    isReadOnly = true;
  }
  if (field.type == "text") {
    return MyTextField(
      label: field.label ?? "",
      controller: field.controller,
      maxlen: field.name == "phoneNumber" ? 10 : 200,
      readOnly: isReadOnly,
      initialValue: field.value ?? "",
      key: Key(field.name),
    );
  } else {
    List<String> items = List.from(field.options!.map((e) => e.toString()));
    return DropDown(
      controller: field.controller,
      items: items,
      hintText: field.label ?? "",
      initialValue: field.value,
    );
  }
}
