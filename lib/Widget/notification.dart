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
      home: NotificationsScreen(),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text('Notifications'),
        
        actions: [
          TextButton(
            onPressed: () {
            },
            child: Text(
              'Read all',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.cyan],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(14.0),
          children: [
            NotificationCard(),
            SizedBox(height: 14.0),
            NotificationCard(),
            SizedBox(height: 14.0),
            NotificationCard(),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.notifications,  
              color: const Color.fromARGB(255, 0, 0, 0),    
              size: 30.0,           
            ),
            SizedBox(width: 10.0),    
            Expanded(                 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'សេចក្ដីជូនដំណឹង',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('សេចក្ដីជូនដំណឹង'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

