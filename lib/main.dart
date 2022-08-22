import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'user/usermodel.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> allList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          final user = allList[i];
          return ListTile(
            leading: Text(i.toString()),
            title: Text(user.email),
            subtitle: Text(user.name.first),
          );
        },
        itemCount: allList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUser();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void fetchUser() async {
    print('fetching....');

    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    //log(json.toString());
    final result = json['results'] as List<dynamic>;
    final info=json['info'] as Map<String,dynamic>;
    log(info.toString());
    final transformed = result.map(
      (e) {
        final name=Name(
          first: e['name']['first'],
          last: e['name']['last'],
          title: e['name']['title'],
        );
        return User(
          gender: e['gender'],
          email: e['email'],
          phone: e['phone'],
          cell: e['cell'],
          nat: e['nat'],
          name: name
        );
      },
    ).toList();
    setState(() {
      allList.clear();
      allList .addAll(transformed) ;
    });
    print('fetch compleated');
  }
}
