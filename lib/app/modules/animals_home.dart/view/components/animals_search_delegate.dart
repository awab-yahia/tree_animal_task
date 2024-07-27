import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_animal_task/app/modules/animals_home.dart/controller/animals_home_controller.dart';
import 'package:tree_animal_task/app/modules/animals_home.dart/view/animals_home_view.dart';
import 'package:tree_animal_task/app/modules/family_tree/view/family_tree_view.dart';

class AnimalsSearchDelegate extends SearchDelegate {
  AnimalsSearchDelegate({String hintText = "Search Animals"})
      : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          searchFieldStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 15,
              backgroundColor: Colors.white),
          // searchFieldDecorationTheme: const InputDecorationTheme(
          //     enabledBorder: InputBorder.none, fillColor: Colors.white),
        );

  AnimalsHomeController animalsHomeController =
      Get.put(AnimalsHomeController());

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query == '') {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return Container(
        color: Colors.white,
      );
    } else {
      animalsHomeController.buildSuggestionsList(query);
      if (animalsHomeController.filteredList == null ||
          animalsHomeController.filteredList!.isEmpty) {
        // show no data dialog
        // return const NoAnimalsExist(); //WTF need refactor to support multi use
        return Padding(
          padding: EdgeInsets.only(top: Get.height * .2),
          child: const NoResults(),
        );
      } else {
        return GetBuilder<AnimalsHomeController>(
          builder: (animalsHomeController) => Container(
            color: Colors.white,
            child: ListView.builder(
                itemCount: animalsHomeController.filteredList?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => FamilyTreeView(
                          rootAnimal:
                              animalsHomeController.animalsList[index]));
                    },
                    child: AnimalsListViewCard(
                        animal: animalsHomeController.filteredList![index]),
                  );
                }),
          ),
        );
      }
    }
  }
}
