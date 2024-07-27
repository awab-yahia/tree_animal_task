import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.onPress, required this.title});

  final Function onPress;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: Get.width * .5,
        height: Get.height * .065,
        decoration: BoxDecoration(
            color: const Color(0XFF0f5d31),
            borderRadius: BorderRadius.circular(24)),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        )),
      ),
    );
  }
}
