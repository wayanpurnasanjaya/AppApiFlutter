import 'package:flutter/material.dart';
import 'package:appapiflutter/ui_view/page_list_user.dart';
import 'package:appapiflutter/ui_view/detail_list_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const PageUserList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

