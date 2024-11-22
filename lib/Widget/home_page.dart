import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_app_ass/Widget/Aattendence_page.dart';
import 'package:new_app_ass/Widget/allmembers.dart';
import 'dart:io';

import 'package:new_app_ass/Widget/drawer_widget.dart';

import 'my_calendar.dart';
import 'notification.dart';
import 'profile.dart';
import 'report.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Smart Attendence System',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 43, 142, 223),
        actions: [
          IconButton(
            icon: Icon(Icons.notification_add),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationsScreen()),
            );
            },
          ),
        ],
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 43, 142, 223),
                        Color.fromARGB(255, 60, 206, 186),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
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
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: _pickImage,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.edit,
                                    color: Colors.white, size: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 100),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(36),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                child: Image.asset('images/avatar.jpg'),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'User Name',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfilePage()),
                                        );
                                      },
                                      child: Text(
                                        'Profile',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 43, 142, 223),
                        Color.fromARGB(255, 60, 206, 186),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Attendance()),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.assignment,
                                size: 40,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Attendance',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Attendance management system',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.chevron_right,
                                  size: 40,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ],
                          ),
                        ),
                        SizedBox(height: 35),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllMembersScreen()),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.people,
                                size: 40,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Members',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'List all members',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.chevron_right,
                                  size: 40,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ],
                          ),
                        ),
                        SizedBox(height: 35),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyCalendarApp()),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 40,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'My Calendar',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Workday & Holiday',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.chevron_right,
                                  size: 40,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ],
                          ),
                        ),
                        SizedBox(height: 35),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportPage()),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.report,
                                size: 40,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Report',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Informations',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.chevron_right,
                                  size: 40,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  CustomListTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          size: 40,
          color: iconColor,
        ),
        title: Text(title),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.chevron_right, size: 40),
        onTap: () {},
      ),
    );
  }
}
