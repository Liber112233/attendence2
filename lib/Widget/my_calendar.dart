import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'home_page.dart';

void main() {
  runApp(MyCalendarApp());
}

class MyCalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Calendar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ); // Pops back to the previous screen
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
        child: Column(
          children: [
            SizedBox(height: 75),
            Container(
              color: Colors.white,
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(color: Colors.red),
                  defaultTextStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Expanded(
              child: ScheduleWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(height: 30),
          TabBar(
            tabs: [
              Tab(text: 'Workday/Time'),
              Tab(text: 'Holiday'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                WorkdayTimeTab(),
                Center(child: Text('Holiday')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WorkdayTimeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        WorkdayTimeTile(day: 'Mon', time: '08:00 AM - 05:00 PM'),
        WorkdayTimeTile(day: 'Tue', time: '08:00 AM - 05:00 PM'),
        WorkdayTimeTile(day: 'Wed', time: '08:00 AM - 05:00 PM'),
        WorkdayTimeTile(day: 'Thu', time: '08:00 AM - 05:00 PM'),
      ],
    );
  }
}

class WorkdayTimeTile extends StatelessWidget {
  final String day;
  final String time;

  WorkdayTimeTile({required this.day, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(day),
      subtitle: Text(time),
    );
  }
}
