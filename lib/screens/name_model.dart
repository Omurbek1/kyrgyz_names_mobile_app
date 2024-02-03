class Name {
  final String name;
  final String description;
  final List<String> tag;
  final String gender;
  final bool favorite;

  Name({
    required this.name,
    required this.description,
    required this.tag,
    required this.gender,
    required this.favorite,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    // Convert the dynamic list to a List<String>
    List<String> tagsFromJson = List<String>.from(json['tag']);

    return Name(
      name: json['name'],
      description: json['description'],
      tag: tagsFromJson,
      gender: json['gender'],
      favorite: json['favorite'] as bool, // Ensure proper type casting
    );
  }
}
