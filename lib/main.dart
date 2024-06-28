
/*
API:
  ~ API stands for Application Programming Interface.
  ~ An API is a set of programming codes that enables data transmission between one software product and another.

REST API:
  ~ Representational State Transfer architecture style

  The 5 essential HTTP methods in RESTFUL API
    @ GET         --> fetching data from server by client side
    @ POST        --> for storing data into server by client
    @ PUT         --> for changing any data file to server, it upgrade complete file
    @ PATCH       --> for upgrade only specific part of file
    @ DELETE      --> for deleting data from the server

JSON:
  ~ JSON stands for JavaScript Object Notation.
  ~ JSON is a lightweight data-interchange format. It is easy for humans to read and write.
 */





import 'package:api/A03_QuotesApp/A03_01_QuotesApp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: A03_01_QuotesApp(),
      )
    );
  }
}


