import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_animal_task/app/modules/animals_home.dart/view/components/create_animal_btm_sheet.dart';

class AddNewAnimalBTN extends StatelessWidget {
  const AddNewAnimalBTN({
    super.key,
    required this.nodeID,
  });

  final String nodeID;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //
        log(nodeID);
        if (nodeID.contains("#")) {
          String clearID = nodeID.replaceAll("#", "");
          Get.bottomSheet(CreateAnimalBtmSheet(
              isToAddChild: true, isToAddParent: false, rootID: clearID));
          //
        } else if (nodeID.contains("^") || nodeID.contains("&")) {
          //
          String firstClear = nodeID.replaceAll("^", "");
          String clearID = firstClear.replaceAll("&", "");
          Get.bottomSheet(CreateAnimalBtmSheet(
              isToAddChild: false, isToAddParent: true, rootID: clearID));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: Get.width * .15,
            height: Get.width * .15,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 233, 233, 233)),
            child: Icon(
              Icons.add,
              size: Get.width * .1,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
