import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart' as graphview;
import 'package:tree_animal_task/app/modules/family_tree/controller/animal_controller.dart';
import 'package:tree_animal_task/app/modules/family_tree/view/components/add_new_animal_btn.dart';
import 'package:tree_animal_task/app/modules/family_tree/view/components/build_animal_card.dart';

class TreeGraphView extends StatelessWidget {
  const TreeGraphView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
                ..style = PaintingStyle.stroke,
              builder: (graphview.Node node) {
                var nodeText = node.key!.value as String;
                return nodeText.contains("#") ||
                        nodeText.contains("#^") ||
                        nodeText.contains("&")
                    ? const AddNewAnimalBTN()
                    : buildAnimalCard(
                        nodeText,
                        node,
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
