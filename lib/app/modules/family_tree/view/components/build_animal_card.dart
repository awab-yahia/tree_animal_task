import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart' as graphview;
import 'package:svg_flutter/svg.dart';
import 'package:tree_animal_task/app/modules/family_tree/controller/family_tree_controller.dart';
import 'package:tree_animal_task/app/data/models/animal.dart';

Widget buildAnimalCard(String text, graphview.Node node) {
  Animal? currentAnimal =
      Get.find<FamilyTreeController>().getSingleAnimal(text);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child:
                SvgPicture.asset("assets/icons/Animals.svg", fit: BoxFit.cover),
          ),
        ),

        //
        SizedBox(
          width: Get.width * .18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // name and gender
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //TODO make Single Text widget
                  Text(
                    currentAnimal?.name ?? "",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  currentAnimal?.gender == 'male'
                      ? SvgPicture.asset('assets/icons/male.svg')
                      : SvgPicture.asset('assets/icons/female.svg')
                ],
              ),

              Text(
                "ID #${currentAnimal?.id}",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),

              const Text(
                // TODO sold and other  status
                "Sold",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
