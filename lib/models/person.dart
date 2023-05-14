class Person {
  final String name;
  final String picturePath;
  final int id;

  Person({required this.name, required this.id, required this.picturePath});

  factory Person.fromJson(Map data) {
    final String name = data["name"];
    final String? picturePath = data["profile_path"];
    final int id = data["id"];

    return Person(name: name, id: id, picturePath: picturePath ?? "String value is null");
  }
}
