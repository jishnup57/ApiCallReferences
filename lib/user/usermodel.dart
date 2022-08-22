class User {
  String gender;
  String email;
  String phone;
  String cell;
  String nat;
  Name name;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
  });
}

class Name {
  String title;
  String first;
  String last;
  Name({
    required this.title,
    required this.first,
    required this.last,
  });
}
