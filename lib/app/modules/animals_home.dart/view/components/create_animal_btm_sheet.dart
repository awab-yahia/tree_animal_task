//
//
//
//NOTE -  is temp widget => dont focus on is it clean or not
//
//
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_animal_task/app/data/models/animal.dart';
import 'package:tree_animal_task/app/modules/animals_home.dart/controller/animals_home_controller.dart';
import 'package:tree_animal_task/core/widgets/custom_btn.dart';
import 'package:tree_animal_task/core/widgets/custom_text_field.dart';
import 'package:tree_animal_task/core/widgets/text/big_text.dart';

class CreateAnimalBtmSheet extends StatefulWidget {
  const CreateAnimalBtmSheet(
      {super.key,
      required this.isToAddChild,
      this.rootID,
      required this.isToAddParent});

  final bool isToAddChild;
  final bool isToAddParent;
  // will be reqired only for adding child or parent ... its optional when adding root animal
  final String? rootID;
  @override
  State<CreateAnimalBtmSheet> createState() => _CreateAnimalBtmSheetState();
}

class _CreateAnimalBtmSheetState extends State<CreateAnimalBtmSheet> {
  // this is just for testing the senario

  TextEditingController idController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      height: Get.height * .5,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: Get.height * .02),
              const BigText(text: "Add Animal", fontSize: 16),
              SizedBox(height: Get.height * .03),
              CustomTextField(label: 'ID', controller: idController),
              SizedBox(height: Get.height * .02),
              CustomTextField(label: 'name', controller: nameController),
              SizedBox(height: Get.height * .02),
              CustomTextField(label: 'gender', controller: genderController),
              SizedBox(height: Get.height * .03),
              CustomBtn(
                title: "Add",
                onPress: () async {
                  // add animal => now local

                  Animal newAnimal = Animal(
                      id: idController.text,
                      name: nameController.text,
                      gender: genderController.text,
                      imageUrl: "assets/icons/Animals.svg",
                      children: List.empty(growable: true),
                      parents: List.empty(growable: true));

                  await Get.find<AnimalsHomeController>().createAnimal(
                      newAnimal: newAnimal,
                      isToAddChild: widget.isToAddChild,
                      isToAddParent: widget.isToAddParent,
                      rootID: widget.rootID);
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    genderController.dispose();
    super.dispose();
  }
}
