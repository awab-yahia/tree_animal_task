import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart' as graphview;
import 'package:tree_animal_task/app/modules/family_tree/controller/animal_controller.dart';

class AddChildDialog extends StatelessWidget {
  final graphview.Node node;
  final TextEditingController nameController = TextEditingController();

  AddChildDialog({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Child Name'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (nameController.text.isNotEmpty) {
              Get.find<FamilyTreeController>()
                  .addChild(node, nameController.text);
              Get.back();
            }
          },
          child: const Text('Add Child'),
        ),
      ],
    );
  }
}
