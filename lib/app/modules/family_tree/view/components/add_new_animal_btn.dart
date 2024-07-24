import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart' as graphview;
import 'package:tree_animal_task/app/modules/family_tree/view/components/add_new_animal.dart';

class AddNewAnimalBTN extends StatelessWidget {
  const AddNewAnimalBTN({
    super.key,
  });
  // final graphview.Node node;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
          title: 'Add Child',
          content: AddChildDialog(node: graphview.Node.Id("10")),
        );
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
