import 'package:flutter/material.dart';
import 'Widget/home_page.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Attendece",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFF5F5F3),
        ),
        routes: {
          "/":(context) => HomePage(),  
        },
      );
    }
 }