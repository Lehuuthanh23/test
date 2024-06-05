import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thuc_tap/model/device.dart';
import 'package:thuc_tap/widget/device_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Device> devices = [];
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDeviceData();
  }

  Future<void> loadDeviceData() async {
    String filePath = 'assets/data/data_device.json';
    String jsonString = await rootBundle.loadString(filePath);
    List<dynamic> jsonData = jsonDecode(jsonString);

    devices = jsonData
        .map((item) => Device(
              id: item['id'],
              name: item['name'],
              status: item['status'],
              type: item['type'],
              directory: item['directory'],
              owner: item['owner'],
              imageUrl: item['imageUrl'],
            ))
        .toList();
    print(devices.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: Colors.amber,
        actions: const [
          Icon(
            Icons.notifications_none_outlined,
            size: 40,
            color: Colors.white,
          )
        ],
        title: const Text(
          'Nam Sài Gòn',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: DeviceCard(
              data: devices[index],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.signal_cellular_alt,
              color: _currentIndex == 0 ? Colors.orange : Colors.grey,
            ),
            label: 'Thiết bị',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_membership,
              color: _currentIndex == 1 ? Colors.orange : Colors.grey,
            ),
            label: 'Gói cước',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.apartment,
              color: _currentIndex == 2 ? Colors.orange : Colors.grey,
            ),
            label: 'Camp',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _currentIndex == 3 ? Colors.orange : Colors.grey,
            ),
            label: 'Tài khoản',
          ),
        ],
      ),
    );
  }

  Future<String> readFileAsString(String filePath) async {
    try {
      return await rootBundle.loadString(filePath);
    } catch (e) {
      print('Error reading file: $e');
      return '';
    }
  }

  Future<dynamic> readJsonFromFile(String filePath) async {
    String fileContent = await readFileAsString(filePath);
    return jsonDecode(fileContent);
  }
}
