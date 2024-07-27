import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart' as graphview;
import 'package:tree_animal_task/app/data/models/animal.dart';
import 'package:tree_animal_task/app/modules/family_tree/controller/family_tree_controller.dart';
import 'package:tree_animal_task/app/modules/family_tree/view/components/add_new_animal_btn.dart';
import 'package:tree_animal_task/app/modules/family_tree/view/components/build_animal_card.dart';

class FamilyTreeView extends StatefulWidget {
  const FamilyTreeView({super.key, required this.rootAnimal});
  final Animal rootAnimal;
  @override
  State<FamilyTreeView> createState() => _FamilyTreeViewState();
}

class _FamilyTreeViewState extends State<FamilyTreeView> {
  FamilyTreeController familyTreeController = Get.put(FamilyTreeController());

  @override
  void initState() {
    familyTreeController.hundleFamilyTree(widget.rootAnimal);
    super.initState();
  }

  @override
  void dispose() {
    familyTreeController.hundleFamilyTree(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Family Tree')),
      body: Center(
        child: InteractiveViewer(
          constrained: false,
          boundaryMargin: const EdgeInsets.all(8.0),
          minScale: 0.01,
          maxScale: 5.6,
          child: GetBuilder<FamilyTreeController>(
            builder: (controller) {
              //
              return graphview.GraphView(
                graph: controller.graph,
                algorithm: graphview.BuchheimWalkerAlgorithm(controller.builder,
                    graphview.TreeEdgeRenderer(controller.builder)),
                paint: Paint()
                  ..color = Colors.green
                  ..strokeWidth = 1.8
                  ..style = PaintingStyle.fill,
                builder: (graphview.Node node) {
                  String nodeID = node.key!.value as String;
                  return nodeID.contains("#") ||
                          nodeID.contains("^") ||
                          nodeID.contains("&")
                      ? AddNewAnimalBTN(nodeID: nodeID)
                      : buildAnimalCard(
                          nodeID,
                          node,
                        );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
