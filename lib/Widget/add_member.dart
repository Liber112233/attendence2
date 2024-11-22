import 'package:flutter/material.dart';
import 'allmembers.dart';
import 'succes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddEmployeeScreen(),
    );
  }
}

class AddEmployeeScreen extends StatefulWidget {
  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _staffIdController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  
  String? _selectedGender = 'Male';
  DateTime? _selectedDate;
  String? _selectedPosition = 'Manager';
  DateTime _joinDate = DateTime.now();
  TimeOfDay _checkInTime = TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _checkOutTime = TimeOfDay(hour: 17, minute: 0);
  
  final List<String> _positions = ['Manager', 'Developer', 'Designer'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Employee'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllMembersScreen()),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Employee Name*',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: _staffIdController,
                  decoration: const InputDecoration(
                    labelText: 'Staff ID',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                  items: ['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'DD/MM/YYYY'
                            : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      ),
                    ),
                    TextButton(
                      onPressed: () => _selectDate(context),
                      child: const Text('Change'),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                DropdownButtonFormField<String>(
                  value: _selectedPosition,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedPosition = newValue;
                    });
                  },
                  items: _positions.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Position',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: _nationalIdController,
                  decoration: const InputDecoration(
                    labelText: 'National ID Card',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),
                ListTile(
                  title: const Text('Join Date*'),
                  subtitle: Text('${_joinDate.toLocal()}'.split(' ')[0]),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _joinDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != _joinDate) {
                      setState(() {
                        _joinDate = picked;
                      });
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text('Check-in'),
                        ElevatedButton(
                          onPressed: () async {
                            TimeOfDay? picked = await showTimePicker(
                              context: context,
                              initialTime: _checkInTime,
                            );
                            if (picked != null && picked != _checkInTime) {
                              setState(() {
                                _checkInTime = picked;
                              });
                            }
                          },
                          child: Text('${_checkInTime.format(context)}'),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Check-out'),
                        ElevatedButton(
                          onPressed: () async {
                            TimeOfDay? picked = await showTimePicker(
                              context: context,
                              initialTime: _checkOutTime,
                            );
                            if (picked != null && picked != _checkOutTime) {
                              setState(() {
                                _checkOutTime = picked;
                              });
                            }
                          },
                          child: Text('${_checkOutTime.format(context)}'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SuccessApp()),
                      );
                      print('Name: ${_nameController.text}');
                      print('Staff ID: ${_staffIdController.text}');
                      print('Gender: $_selectedGender');
                      print('Date: $_selectedDate');
                      print('Phone: ${_phoneController.text}');
                      print('Position: $_selectedPosition');
                      print('National ID: ${_nationalIdController.text}');
                      print('Address: ${_addressController.text}');
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
