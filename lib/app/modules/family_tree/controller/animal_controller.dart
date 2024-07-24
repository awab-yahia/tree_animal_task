import 'dart:developer';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart' as graphview;
import 'package:tree_animal_task/app/modules/family_tree/model/animal.dart';

class FamilyTreeController extends GetxController {
  final graphview.Graph graph = graphview.Graph()..isTree = true;
  graphview.BuchheimWalkerConfiguration builder =
      graphview.BuchheimWalkerConfiguration();

  @override
  void onInit() async {
    super.onInit();
    fetchRootAnimal();
    initilizeNodes(rootAnimal);
    buildAnimalTree();
  }

  Animal? rootAnimal;
  Map<String, graphview.Node> nodes = {};

  List<Animal> animalsList = List.empty(growable: true);

  // fetch if threr is root animal or not
  fetchRootAnimal() {
    // await Future.delayed(const Duration(seconds: 2));
    var result = Animal(
        id: '1',
        name: 'mark',
        gender: 'male',
        imageUrl: 'assets/icons/Animals.svg',
        //
        children: <Animal>[
          Animal(
            id: '2',
            name: 'mark2',
            gender: 'male',
            imageUrl: 'assets/icons/Animals.svg',
            parents: [],
            children: [],
          ),
          Animal(
            id: '3',
            name: 'mark3',
            gender: 'male',
            imageUrl: 'assets/icons/Animals.svg',
            parents: [],
            children: [],
          )
        ],
        parents: <Animal>[
          Animal(
            id: '4',
            name: 'mark',
            gender: 'male',
            imageUrl: 'assets/icons/Animals.svg',
            parents: [],
            children: [],
          ),
          Animal(
            id: '5',
            name: 'mark',
            gender: 'female',
            imageUrl: 'assets/icons/Animals.svg',
            parents: [],
            children: [],
          ),
        ]);

    //
    animalsList.add(result);
    animalsList.addAll(result.parents);
    animalsList.addAll(result.children);
    rootAnimal = result;
    update();
    // return result;
  }

  initilizeNodes(Animal? animal) {
    if (rootAnimal == null) {
      // remove if no root animal
      nodes.clear();
    } else {
      for (var animal in animalsList) {
        // set children nodes

        // ive and idea to let the node id = the animal itseld and use eqitable => deserve trying
        nodes['${animal.id}#'] =
            graphview.Node.Id('${animal.id}#'); // to make the addition btn

        // node for the current animal him self

        nodes[animal.id] = graphview.Node.Id(animal.id);

        Animal? father, mother;

        for (var animal in animal.children) {
          nodes[animal.id] = graphview.Node.Id(animal.id);
        }

        // set parents nodes

        for (var animal in animal.parents) {
          if (animal.gender == "male") {
            father = animal;
          } else if (animal.gender == "female") {
            mother = animal;
          }
        }

        //father nodes
        if (father == null) {
          // ^ for men => if father is empty the id contain ( ^ ) with the same animal id
          nodes['${animal.id}^'] = graphview.Node.Id('${animal.id}^');
        } else {
          nodes[father.id] = graphview.Node.Id(father.id);
        }

        // mother nodes
        if (mother == null) {
          // ^ for men => if mother is empty the id contain ( & ) with the same animal id
          nodes['${animal.id}&'] = graphview.Node.Id('${animal.id}&');
        } else {
          nodes[mother.id] = graphview.Node.Id(mother.id);
        }
      }
    }
    update();
  }

  buildAnimalTree() {
    try {
      if (nodes.isNotEmpty) {
        builder
          ..siblingSeparation = (50)
          ..levelSeparation = (150)
          ..subtreeSeparation = (150)
          ..orientation =
              graphview.BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;

        //
        log(nodes.entries.toString());
        for (var currentAnimal in animalsList) {
          // drow children edges

          graph.addEdge(nodes[currentAnimal.id]!,
              nodes['${currentAnimal.id}#']!); // for add new child

          if (currentAnimal.children.isNotEmpty) {
            for (var child in currentAnimal.children) {
              graph.addEdge(nodes[currentAnimal.id]!, nodes[child.id]!);
            }
          }

          // drow parents edges
        }

        // dro
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
