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
    final List<User> transformed = result.map(
      (e) {
        return User.fromJson(e);
      },
    ).toList();

    print('fetch compleated');

    return transformed;
  }
}
