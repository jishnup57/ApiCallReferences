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

  factory User.fromJson(Map<String, dynamic> e) {
    final name = Name.fromJson(e['name']);
    final dob = Dob.fromJson(e['dob']);

    final location = Location.fromJson(e['location']);
    return User(
      gender: e['gender'],
      email: e['email'],
      phone: e['phone'],
      cell: e['cell'],
      nat: e['nat'],
      name: name,
      dob: dob,
      location: location,
    );
  }
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
  factory Name.fromJson(Map<String, dynamic> e) {
    final name = Name(
      first: e['first'],
      last: e['last'],
      title: e['title'],
    );
    return name;
  }
}

class Dob {
  DateTime date;
  int age;
  Dob({
    required this.age,
    required this.date,
  });
  factory Dob.fromJson(Map<String, dynamic> e) {
    final date = e['date'];
    return Dob(age: e['age'], date: DateTime.parse(date));
  }
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
  factory Location.fromJson(Map<String, dynamic> e) {
    final coordinates = LocationCoordinates.fromJson(e['coordinates']);
    return Location(
      city: e['city'],
      country: e['country'],
      postcode: e['postcode'].toString(),
      state: e['state'],
      coordinates: coordinates,
    );
  }
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
  factory LocationCoordinates.fromJson(Map<String, dynamic> e) {
    return LocationCoordinates(
      latitude: e['latitude'],
      longitude: e['longitude'],
    );
  }
}
