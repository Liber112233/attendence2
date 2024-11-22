import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app_ass/Widget/login.dart';
import 'package:new_app_ass/Widget/profile.dart';

import 'setting.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
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
              accountName: Text(
                "Koang Vathana Caliber",
                style: TextStyle(
                  fontSize: 20,
                  height: 1,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "Liber119@gmail.com",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  "images/avatar.jpg",
                ),
              ),
            ),
          ),
          Column(
            children: [
              _buildDrawerItem(
                icon: CupertinoIcons.person,
                title: "Profile",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              _buildDrawerItem(
                icon: CupertinoIcons.settings,
                title: "Settings",
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
              ),
              _buildDrawerItem(
                icon: Icons.exit_to_app,
                title: "Log Out",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onPressed,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color.fromARGB(255, 43, 142, 223),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onPressed,
    );
  }
}
