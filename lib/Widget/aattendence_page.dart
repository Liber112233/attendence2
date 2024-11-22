import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'scaner.dart';

void main() {
  runApp(Attendance());
}

class Attendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0083B0), Color(0xFF00B4DB)],
                    ),
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(30)),
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
                                  builder: (context) => HomePage()),
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Attendance',
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
                const SizedBox(height: 20),
                Text(
                  '10 August 2024',
                  style: TextStyle(
                    fontSize: 24,
                    height: 6,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 18, 235, 25),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Check-In/Out:',
                      style: TextStyle(
                        fontSize: 18,
                        height: 2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QRScannerScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: const Text('Check-In'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QRScannerScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: const Text('Check-Out'),
                ),
                const Text(
                  '​មូលហេតុមកយឺត​ រឺ​ សុំច្បាប់​​​',
                  style: TextStyle(
                    fontSize: 24,
                    height: 4,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 247, 247, 247),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Please write your reason here.....',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2.5,
                    children: [
                      reasonButton('Sorry I am late'),
                      reasonButton('បញ្ហាសុខភាព'),
                      reasonButton('ភ្លេចទូរស័ព្ទ'),
                      reasonButton('បញ្ហាអាកាសធាតុ'),
                      reasonButton('ស្ទះផ្លូវ'),
                      reasonButton('មិនស្រួលខ្លួន'),
                      reasonButton('ភ្លេច Check-in'),
                      reasonButton('គ្រោះថ្នាក់តាមផ្លូវ'),
                      reasonButton('មាន​ធុរជាមួយគ្រួសារ'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 40,
                  width: 80,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: const Text('Done'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget reasonButton(String reason) {
    return ElevatedButton(
      onPressed: () {}, // Add functionality for reason button
      child: Text(
        reason,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          height: 2,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
