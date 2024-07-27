import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:tree_animal_task/app/data/models/animal.dart';
import 'package:tree_animal_task/app/modules/animals_home.dart/controller/animals_home_controller.dart';
import 'package:tree_animal_task/app/modules/animals_home.dart/view/components/animals_search_delegate.dart';
import 'package:tree_animal_task/app/modules/animals_home.dart/view/components/create_animal_btm_sheet.dart';
import 'package:tree_animal_task/app/modules/family_tree/view/family_tree_view.dart';
import 'package:tree_animal_task/core/widgets/custom_btn.dart';
import 'package:tree_animal_task/core/widgets/text/big_text.dart';
import 'package:tree_animal_task/core/widgets/text/small_text.dart';

class AnimalsHomeView extends StatelessWidget {
  const AnimalsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("animals-pets"),
        actions: [
          InkWell(
            onTap: () {
              showSearch(context: context, delegate: AnimalsSearchDelegate());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * .025),
              child: const Icon(Icons.search),
            ),
          )
        ],
      ),
      body: GetBuilder<AnimalsHomeController>(
        builder: (animalsHomeController) =>
            animalsHomeController.animalsList.isNotEmpty
                ? AnimalsList()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const NoAnimalsExist(),
                      CustomBtn(
                        title: "Create an animal",
                        onPress: () {
                          Get.bottomSheet(const CreateAnimalBtmSheet(
                            isToAddChild: false,
                            isToAddParent: false,
                          ));
                        },
                      )
                    ],
                  ),
      ),
      bottomNavigationBar: GetBuilder<AnimalsHomeController>(
        builder: (animalsHomeController) =>
            animalsHomeController.animalsList.isEmpty
                ? const SizedBox()
                : SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * .02,
                        vertical: Get.height * .01,
                      ),
                      child: CustomBtn(
                        title: "Add new animal",
                        onPress: () {
                          Get.bottomSheet(const CreateAnimalBtmSheet(
                              isToAddChild: false, isToAddParent: false));
                        },
                      ),
                    ),
                  ),
      ),
    );
  }
}

class AnimalsList extends StatelessWidget {
  AnimalsList({super.key});

  final AnimalsHomeController animalsHomeController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: animalsHomeController.animalsList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(() => FamilyTreeView(
                rootAnimal: animalsHomeController.animalsList[index]));
          },
          child: AnimalsListViewCard(
              animal: animalsHomeController.animalsList[index]),
        );
      },
    );
  }
}

class AnimalsListViewCard extends StatelessWidget {
  const AnimalsListViewCard({
    super.key,
    required this.animal,
  });

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * .015),
      child: SizedBox(
        height: Get.height * .05,
        child: Row(
          children: [
            SvgPicture.asset(animal.imageUrl),
            SizedBox(width: Get.width * .02),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: animal.name, fontSize: 15),
                Row(
                  children: [
                    SmallText(text: "${animal.gender}, ", fontSize: 14),
                    const SmallText(text: "2 years", fontSize: 14),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NoAnimalsExist extends StatelessWidget {
  const NoAnimalsExist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NoResults(),
        //
        SizedBox(height: Get.height * .02),
        //
        const SmallText(
            text: "Do you want to create an animal ?", fontSize: 14),
      ],
    );
  }
}

class NoResults extends StatelessWidget {
  const NoResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: SvgPicture.asset("assets/icons/tree.svg")),

        SizedBox(height: Get.height * .05),
        //
        const BigText(text: "No Results", fontSize: 16),
      ],
    );
  }
}
