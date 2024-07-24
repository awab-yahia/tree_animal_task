class Animal {
  final String id;
  final String name;
  final String gender;
  final String imageUrl;
  final List<Animal> parents;
  final List<Animal> children;

  Animal({
    required this.id,
    required this.name,
    required this.gender,
    required this.imageUrl,
    this.parents = const <Animal>[],
    this.children = const <Animal>[],
  });
}
