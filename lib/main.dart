import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_animal_task/app.dart';
import 'package:tree_animal_task/app/modules/animals_home.dart/controller/animals_home_controller.dart';

void main() {
  Get.put(AnimalsHomeController(), permanent: true);
  runApp(const MyApp());
}
