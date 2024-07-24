import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class EmptyTreeWidget extends StatelessWidget {
  const EmptyTreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: SvgPicture.asset("assets/icons/tree.svg")),
        GestureDetector(
          onTap: () {
            // add new tree
          },
          child: Container(
            width: Get.width * .5,
            height: Get.height * .065,
            decoration: BoxDecoration(
                color: const Color(0xff00f5d31),
                borderRadius: BorderRadius.circular(24)),
            child: const Center(
                child: Text(
              "Create an animal",
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
          ),
        )
      ],
    );
  }
}
