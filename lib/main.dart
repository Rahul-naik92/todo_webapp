import 'package:flutter/material.dart';
import 'package:flutter_crud_getx_web/view/todo_home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // return GetCupertinoApp(
      title: 'GetX Todo App',
      theme: ThemeData(primarySwatch: Colors.orange),

      home: AddToDoHomePage(),
      // debugShowCheckedModeBanner: false,
    );
  }
}
