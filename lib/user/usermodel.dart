class User {
  String gender;
  String email;
  String phone;
  String cell;
  String nat;
  Name name;
  Dob dob;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
  });

  String get fullName {
    return '${name.first} ${name.title} ${name.last}';
  }
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

class Dob {
  DateTime date;
  int age;
  Dob({
    required this.age,
    required this.date,
  });
}
