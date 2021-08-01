class User {
  final String name;
  final String email;
  final String city;
  final String companyName;

  User({
    required this.name,
    required this.email,
    required this.city,
    required this.companyName,
  });

  String get nameFirstCharacter => name.substring(0, 1);
}
