import 'package:flutter/material.dart';
import 'allmembers.dart';

void main() {
  runApp(SuccessApp());
}

class SuccessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 43, 142, 223),
                Color.fromARGB(255, 60, 206, 186),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 236, 240, 237),
                  ),
                  child: Icon(
                    Icons.check,
                    size: 50,
                    color: Color.fromARGB(255, 27, 235, 37),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "Success!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllMembersScreen()),
                    );
                  },
                  child: Text("Okay"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
