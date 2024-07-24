import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_animal_task/app/modules/family_tree/view/family_tree.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FamilyTreePage(),
    );
  }
}
