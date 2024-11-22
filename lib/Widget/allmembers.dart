import 'package:flutter/material.dart';
import 'package:new_app_ass/Widget/home_page.dart';

import 'add_member.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AllMembersScreen(),
    );
  }
}

class AllMembersScreen extends StatelessWidget {
  const AllMembersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(       
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('All Members',
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
            letterSpacing: 1.2,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 34,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  HomePage()),
              ); 
          },
        ),
      ),
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
        
        child: Column(
          children: [
            SizedBox(height: 15),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  MemberCard(
                    imageUrl: 'images/avatar.jpg', 
                    userName: 'User name',
                    bodyText: 'Add a little bit of body text',
                    phoneNumber: '+855 00000000',
                  ),
                  MemberCard(
                    imageUrl: 'images/avatar.jpg',
                    userName: 'User name',
                    bodyText: 'Add a little bit of body text',
                    phoneNumber: '+855 00000000',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  AddEmployeeScreen()),
              );
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.blueAccent),
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String bodyText;
  final String phoneNumber;

  const MemberCard({
    Key? key,
    required this.imageUrl,
    required this.userName,
    required this.bodyText,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imageUrl,  
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(bodyText),
                  Text(
                    phoneNumber,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.phone,
                color: Colors.green,
              ),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
