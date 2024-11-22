import 'package:flutter/material.dart';
import 'package:new_app_ass/Widget/allmembers.dart';

import 'profile.dart';
import 'succes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditPersonalInfoScreen(),
    );
  }
}

class EditPersonalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // appBar: AppBar(
      //   title: Text('Edit Personal Info'),

      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () {
      //        Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) =>  AllMembersScreen()),
      //         );
      //     },
      //   ),
      // ),
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
        child: Center(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0083B0), Color(0xFF00B4DB)],
                        ),
                        borderRadius:
                            const BorderRadius.vertical(bottom: Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.white, size: 30),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()),
                                );
                              },
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Personal info',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      _buildContactDetailInput(Icons.location_city, 'City/Province'),
                      _buildContactDetailInput(Icons.home, 'District/Khan'),
                      _buildContactDetailInput(Icons.location_on, 'Commune/Sangkat'),
                      _buildContactDetailInput(Icons.place, 'Village'),
                      _buildContactDetailInput(Icons.phone, 'PhoneNumber'),
                      SizedBox(height: 16),
                      SizedBox(height: 8),
                      Text(
                        'Always keep the phone number updated or you may lose access to your Mobile App',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 12),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SuccessApp()),
                          );
                        },
                        child: Text('Done'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactDetailInput(IconData icon, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
