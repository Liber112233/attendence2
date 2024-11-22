import 'package:flutter/material.dart';
import 'package:new_app_ass/Widget/aattendence_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CheckInScreen(),
    );
  }
}

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({Key? key}) : super(key: key);

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isCameraVisible = false;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('QR Code Scanned'),
          content: Text(scanData.code ?? 'No data found'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void toggleCamera() {
    setState(() {
      isCameraVisible = !isCameraVisible;
      if (isCameraVisible) {
        _requestCameraPermission();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check-in'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Attendance()),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'QR',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 200,
                height: 100,
                color: Colors.grey,
                child: isCameraVisible
                    ? Container(
                       width: double.infinity,
                       height: double.infinity,
                       
                        child: QRView(

                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                        ),
                      )
                    : const Center(
                        child: Text(
                          'QR Code Area',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.flashlight_on),
                iconSize: 30,
                onPressed: () {
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: toggleCamera,
                child: Text(isCameraVisible ? 'Hide Camera' : 'Scan QR Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
