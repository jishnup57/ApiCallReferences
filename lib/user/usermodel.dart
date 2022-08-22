class User {
  String gender;
  String email;
  String phone;
  String cell;
  String nat;
  Name name;
  Dob dob;
  Location location;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
     required this.location,
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

class Location {
   String city;
   String state;
   String country;
   String postcode;
  // final LocationStreet street;
  LocationCoordinates coordinates;
  Location({
    required this.city,
    required this.country,
    required this.postcode,
    required this.state,
    // required this.street
    required this.coordinates,
  });
}

class LocationStreet {
  final String number;
  final String name;
  LocationStreet({required this.number, required this.name});
}

class LocationCoordinates {
  String latitude;
  String longitude;
  LocationCoordinates({
    required this.latitude,
    required this.longitude,
  });
}
