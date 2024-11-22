import 'package:flutter/material.dart';
import 'package:new_app_ass/Widget/home_page.dart';

void main() {
  runApp(ReportPage());
}

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AttendancePage(),
    );
  }
}

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final List<Map<String, dynamic>> _attendanceData = [
    {
      'date': '2023-05-10',
      'records': [
        {'type': 'Check-in 1', 'status': 'Late 23m', 'time': '08:23 AM'},
        {'type': 'Check-out 1', 'status': 'Good 4m', 'time': '12:04 PM'},
        {'type': 'Check-in 2', 'status': 'Early 28m', 'time': '12:31 PM'},
        {'type': 'Check-out 2', 'status': 'Good 15m', 'time': '17:15 PM'},
      ],
    },
    {
      'date': '2023-05-12',
      'records': [
        {'type': 'Check-in', 'status': 'On Time', 'time': '14:54'},
         {'type': 'Check-in', 'status': 'On Time', 'time': '14:54'},
          {'type': 'Check-in', 'status': 'On Time', 'time': '14:54'},
           {'type': 'Check-in', 'status': 'On Time', 'time': '14:54'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Tracker'),
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
        
        child: ListView.builder(
          itemCount: _attendanceData.length,
          itemBuilder: (context, index) {
            final date = _attendanceData[index]['date'];
            final records = _attendanceData[index]['records'];
        
            return Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ...records.map((record) {
                      return ListTile(
                        title: Text(record['type']),
                        subtitle: Text(record['status']),
                        trailing: Text(record['time']),
                      );
                    }).toList(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
