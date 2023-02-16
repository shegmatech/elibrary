import 'package:elibrary/views/book_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:elibrary/views/login.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context)=> LoginPage(),
      },
    );
  }
}