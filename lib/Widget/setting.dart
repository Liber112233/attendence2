import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsScreen(),
    );
  }
}
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
          },
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
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
          
       child: ListView(
  children: <Widget>[
    SizedBox(height: 30),
    ListTile(
      title: Text(
        'Privacy Policy',
        style: TextStyle(color: Colors.white), 
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white), 
      onTap: () {},
    ),
    ListTile(
      title: Text(
        'About Us',
        style: TextStyle(color: Colors.white), 
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () {},
    ),
    ListTile(
      title: Text(
        'Feedback App',
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () {},
    ),
    ListTile(
      title: Text(
        'Switch Account',
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () {},
    ),
    ListTile(
      title: Text(
        'Leave Company',
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () {},
    ),
  ],
),

      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'App Version 2.2.2',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
