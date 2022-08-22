
import 'package:apiparcing/service/service.dart';
import 'package:flutter/material.dart';

import 'user/usermodel.dart';

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
  void initState() {
    
    super.initState();
    apicall();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      allList.isEmpty?const Center(child: CircularProgressIndicator()):
       ListView.builder(
        itemBuilder: (ctx, i) {
          final user = allList[i];
          return ListTile(
            leading: Text(i.toString()),
            title: Text(user.location.coordinates.latitude),
            subtitle: Text(user.location.coordinates.longitude),
          );
        },
        itemCount: allList.length,
      ),
    
    );
  }
 apicall()async{
   final newlist=await ApiCall.fetchUser();
   setState(() {
    allList.clear();
     allList.addAll(newlist);
   });
 }
 
}
