import 'dart:developer';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart' as graphview;
import 'package:tree_animal_task/app/data/models/animal.dart';

class FamilyTreeController extends GetxController {
  //
  final graphview.Graph graph = graphview.Graph()..isTree = true;
  graphview.BuchheimWalkerConfiguration builder =
      graphview.BuchheimWalkerConfiguration();

  Animal? rootAnimal;
  List<Animal> animalsList = List.empty(growable: true);
  Map<String, graphview.Node> nodes = {};

  //
  Future hundleFamilyTree(Animal? animal) async {
    // to add new value and make it null on dispose
    rootAnimal = animal;

    if (rootAnimal == null) {
      nodes.clear();
      animalsList.clear();
      update();
    } else {
      buildAnimalsFamilyList(rootAnimal!);
      initilizeNodes(rootAnimal!);
      buildAnimalTree();
    }
  }

  //
  buildAnimalsFamilyList(Animal animal) {
    animalsList.add(animal);
    animalsList.addAll(animal.parents ?? []);
    animalsList.addAll(animal.children ?? []);
    update();
  }

  //
  initilizeNodes(Animal rootAnimal) {
    try {
      //
      // ive and idea to let the node id = the animal itseld and use eqitable => deserve trying
      nodes['${rootAnimal.id}#'] =
          graphview.Node.Id('${rootAnimal.id}#'); // to make the addition btn

      if (rootAnimal.parents.isEmpty) {
        // to make the addition btn
        // =>   ^ means its the father position
        // =>   & means its the Mother position
        nodes['${rootAnimal.id}&'] = graphview.Node.Id('${rootAnimal.id}&');
        nodes['${rootAnimal.id}^'] = graphview.Node.Id('${rootAnimal.id}^');
      } else if (rootAnimal.parents.length == 1) {
        if (rootAnimal.parents[0].gender == "male") {
          nodes['${rootAnimal.id}&'] = graphview.Node.Id('${rootAnimal.id}&');
        } else {
          nodes['${rootAnimal.id}^'] = graphview.Node.Id('${rootAnimal.id}^');
        }
      }

// add all other nodes
      for (var animal in animalsList) {
        nodes[animal.id] = graphview.Node.Id(animal.id);
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  buildAnimalTree() {
    try {
      if (nodes.isNotEmpty) {
        //
        builder
          ..siblingSeparation = (150)
          ..levelSeparation = (150)
          ..subtreeSeparation = (150)
          ..orientation =
              graphview.BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;

        //
        log(nodes.entries.toString());

        // for add new child
        graph.addEdge(nodes[rootAnimal!.id]!, nodes['${rootAnimal!.id}#']!);

        // dad
        if (nodes['${rootAnimal!.id}^'] != null) {
          graph.addEdge(nodes['${rootAnimal!.id}^']!, nodes[rootAnimal!.id]!);
        }

        // mom
        if (nodes['${rootAnimal!.id}&'] != null) {
          graph.addEdge(nodes['${rootAnimal!.id}&']!, nodes[rootAnimal!.id]!);
        }

        // drow all other  edges
        for (var animal in animalsList) {
          // drow children edges
          if (animal.children.isNotEmpty) {
            for (var child in animal.children) {
              if (nodes[child.id] == null) {
                nodes[child.id] = graphview.Node.Id(child.id);
              }
              graph.addEdge(nodes[animal.id]!, nodes[child.id]!);
            }
          }

          // drow parents edges
          if (animal.parents.isNotEmpty) {
            for (var parent in animal.parents) {
              if (nodes[parent.id] == null) {
                // add the node first =>
                nodes[parent.id] = graphview.Node.Id(parent.id);
              }
              graph.addEdge(nodes[parent.id]!, nodes[animal.id]!);
            }
          }
        }

        update();
      }
    } catch (e) {
      rethrow;
    }
  }

  getSingleAnimal(String id) {
    for (var animal in animalsList) {
      if (animal.id == id) {
        return animal;
      }
    }
  }

  void addChild(graphview.Node parent, String childName) {
    final child = graphview.Node.Id(childName);
    graph.addEdge(parent, child);
    update();
  }
}
