import 'dart:convert';
import 'dart:developer';

import 'package:apiparcing/user/usermodel.dart';

import 'package:http/http.dart' as http;

class ApiCall {
  static Future<List<User>> fetchUser() async {
    print('fetching....');

    const url = 'https://randomuser.me/api/?results=1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    //log(json.toString());
    final result = json['results'] as List<dynamic>;
    final info = json['info'] as Map<String, dynamic>;
    log(info.toString());
    final transformed = result.map(
      (e) {
        final name = Name(
          first: e['name']['first'],
          last: e['name']['last'],
          title: e['name']['title'],
        );
        final date = e['dob']['date'];

        final dob = Dob(age: e['dob']['age'], date: DateTime.parse(date));

        // final street = LocationStreet(
        //   number: e['location']['street']['number'].toString(),
        //   name: e['location']['street']['name'],
        // );

        final coordinates = LocationCoordinates(
          latitude: e['location']['coordinates']['latitude'],
          longitude:e ['location']['coordinates']['longitude'],
        );
        final location = Location(
          city: e['location']['city'],
          country: e['location']['country'],
          postcode: e['location']['postcode'].toString(),
          state: e['location']['state'],
          coordinates: coordinates,
        );
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
      },
    ).toList();

    print('fetch compleated');

    return transformed;
  }
}
