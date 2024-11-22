import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'edite_pf.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
        width: double.infinity,
        height: double.infinity,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.transparent,
                            backgroundImage: _profileImage != null
                                ? FileImage(_profileImage!)
                                : AssetImage('images/avatar.jpg')
                                    as ImageProvider,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Nubb',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'ID: 000000009',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Personal info',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(), 
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditPersonalInfoScreen()),
              );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ContactDetail(
                      icon: Icons.person,
                      label: 'NAME',
                      value: 'KOANG VATHANACALIBRE',
                    ),
                    ContactDetail(
                      icon: Icons.work,
                      label: 'Position',
                      value: 'CEO',
                    ),
                    ContactDetail(
                      icon: Icons.code,
                      label: 'ID',
                      value: '0000001',
                    ),
                    ContactDetail(
                      icon: Icons.male,
                      label: 'Sex',
                      value: 'Male',
                    ),
                    ContactDetail(
                      icon: Icons.date_range,
                      label: 'Date of birth',
                      value: 'February 09,02',
                    ),
                    ContactDetail(
                      icon: Icons.location_on,
                      label: 'Village',
                      value: 'Sla Ket',
                    ),
                    ContactDetail(
                      icon: Icons.location_on,
                      label: 'Commune/Sangkat',
                      value: 'Sla Ket',
                    ),
                    ContactDetail(
                      icon: Icons.location_on,
                      label: 'City',
                      value: 'Battambang',
                    ),
                    ContactDetail(
                      icon: Icons.location_on,
                      label: 'Provine',
                      value: 'Battambang',
                    ),
                    ContactDetail(
                      icon: Icons.email,
                      label: 'Email',
                      value: 'liber0909@gmail.com',
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.green),
                        SizedBox(width: 8),
                        Text(
                          '+855 719849868',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Always keep the phone number updated or you may lose access to your Mobile App',
                      style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 66, 53, 52)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  ContactDetail({required this.icon, required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8),
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
