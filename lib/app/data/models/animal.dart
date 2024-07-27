class Animal {
  final String id;
  final String name;
  final String gender;
  final String imageUrl;
  List<Animal> parents = List.empty(growable: true);
  List<Animal> children = List.empty(growable: true);

  Animal({
    required this.id,
    required this.name,
    required this.gender,
    required this.imageUrl,
    required this.parents,
    required this.children,
  });
}
