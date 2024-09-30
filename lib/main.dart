import 'package:flutter/material.dart';
import 'package:skin/fitur/home.dart';
import 'package:skin/fitur/schedule.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SkincareScreen(),
    );
  }
}

class SkincareScreen extends StatefulWidget {
  const SkincareScreen({super.key});

  @override
  _SkincareScreenState createState() => _SkincareScreenState();
}

class _SkincareScreenState extends State<SkincareScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SchedulePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(1);
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.camera_alt,
          color: Color.fromARGB(255, 16, 76, 179),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Color.fromARGB(255, 16, 76, 179),
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                color: Colors.white,
                onPressed: () {
                  _onItemTapped(0);
                },
              ),
              IconButton(
                icon: const Icon(Icons.calendar_month_rounded),
                color: Colors.white,
                onPressed: () {
                  _onItemTapped(1);
                },
              ),
              const SizedBox(width: 40),
              IconButton(
                icon: const Icon(Icons.group),
                color: Colors.white,
                onPressed: () {
                  _onItemTapped(3);
                },
              ),
              IconButton(
                icon: const Icon(Icons.person),
                color: Colors.white,
                onPressed: () {
                  _onItemTapped(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
