import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_animal_task/app/modules/family_tree/controller/animal_controller.dart';
import 'package:tree_animal_task/app/modules/family_tree/view/components/empty_tree.dart';
import 'package:tree_animal_task/app/modules/family_tree/view/components/tree_graph_view.dart';

class FamilyTreePage extends StatelessWidget {
  final FamilyTreeController controller = Get.put(FamilyTreeController());

  FamilyTreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Family Tree'),
        ),
        body: GetBuilder<FamilyTreeController>(
            builder: (controller) => controller.rootAnimal == null
                ? const EmptyTreeWidget()
                : const TreeGraphView()));
  }
}
