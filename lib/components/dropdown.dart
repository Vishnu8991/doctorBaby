import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownTextField extends StatelessWidget {
  final TextEditingController controller;
  final RxList<String> items;
  final String hintText;

  const DropdownTextField({
    Key? key,
    required this.controller,
    required this.items,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextField(
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          labelText: hintText,
          suffixIcon: PopupMenuButton<String>(
            icon: const Icon(Icons.arrow_drop_down),
            onSelected: (value) {
              controller.text = value;
            },
            itemBuilder: (BuildContext context) {
              return items.map<PopupMenuItem<String>>((String value) {
                return PopupMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList();
            },
          ),
        ),
      );
    });
  }
}
