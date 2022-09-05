import 'dart:convert';
import 'dart:developer';

import 'package:apiparcing/medicine/model.dart';
import 'package:http/http.dart' as http;
class MedicineApiCall {
  static Future<Medicine> fetchUser() async {
    print('fetching....');

    const url = 'https://run.mocky.io/v3/fc373bae-51c2-426d-9103-218d298d3e66';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    
    final result = jsonDecode(body);
    log(result.toString());
   
    final data=Medicine.fromJson(result);
    // final info = json['info'] as Map<String, dynamic>;
    // log(info.toString());
    // final List<User> transformed = result.map(
    //   (e) {
    //     return User.fromJson(e);
    //   },
    // ).toList();

    print('fetch compleated');

    // return transformed;
    return data;
  }
}
