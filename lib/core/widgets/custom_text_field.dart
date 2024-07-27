import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_animal_task/core/widgets/text/small_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .025),
      child: TextFormField(
        decoration:
            InputDecoration(label: SmallText(text: label, fontSize: 14)),
        controller: controller,
      ),
    );
  }
}
