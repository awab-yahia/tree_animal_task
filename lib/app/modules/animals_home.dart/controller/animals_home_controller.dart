import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:tree_animal_task/app/data/models/animal.dart';
import 'package:tree_animal_task/app/modules/family_tree/controller/family_tree_controller.dart';

class AnimalsHomeController extends GetxController {
  List<Animal> animalsList = List.empty(growable: true);

  createAnimal({
    required Animal newAnimal,
    String? rootID,
    required bool isToAddChild,
    required bool isToAddParent,
  }) async {
    //local rn

    // save the new animal in the root id tree
    if (isToAddChild == true) {
      //
      for (var animal in animalsList) {
        if (animal.id == rootID) {
          // make him the father + here can do some bussinuss logic
          newAnimal.parents.add(animal);
          // make him a child
          animal.children.add(newAnimal);
          await Get.delete<FamilyTreeController>();
          animalsList.add(newAnimal);
          update();
          Get.back();
          return;
        }
      }
    } else if (isToAddParent == true) {
      //
      for (var animal in animalsList) {
        if (animal.id == rootID) {
          //
          // make the animal a childto new animal
          newAnimal.children.add(animal);
          // make him a child

          var selectedAnimal = animal;
          selectedAnimal.parents.add(newAnimal);
          animalsList.remove(animal);
          animalsList.add(selectedAnimal);
          animal.parents.add(newAnimal);
          Get.back();
          await Get.delete<FamilyTreeController>();
          animalsList.add(newAnimal);
          update();
          return;
        }
      }
    } else {
      // normal situation  for adding new animal
      // animalsList[0].parents.add(newAnimal);
      // log(animalsList[0].parents.lastOrNull.toString());
      // log(animalsList[0].parents.lastOrNull.toString());
      animalsList.add(newAnimal);
      update();
    }
  }

  //

//SECTION -  serch part
  List<Animal>? filteredList = List.empty(growable: true);

  buildSuggestionsList(String query) {
    filteredList = animalsList
        .where(
            (animal) => animal.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  // remove item from suggestions

  removeSuggestion(int index) {
    filteredList?.removeAt(index);
    update();
  }
}
