import 'package:flutter/material.dart';
import 'package:skin/fitur/home.dart';

class SkincareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skincare Routine',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Awal'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mulai Rutinitas Skincare'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SkincarePageView()),
            );
          },
        ),
      ),
    );
  }
}

class SkincarePageView extends StatefulWidget {
  @override
  _SkincarePageViewState createState() => _SkincarePageViewState();
}

class _SkincarePageViewState extends State<SkincarePageView> {
  final PageController _pageController = PageController();

  void _nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rutinitas Skincare'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Kembali ke HomeScreen saat ikon back ditekan
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          SkincareRoutine('RUTINITAS SKINCARE 1', _nextPage),
          SkincareRoutine('RUTINITAS SKINCARE 2', _nextPage),
          SkincareRoutine('RUTINITAS SKINCARE 3', _nextPage),
          BlankScreen(), // Halaman kosong di akhir
        ],
      ),
    );
  }
}

class SkincareRoutine extends StatelessWidget {
  final String title;
  final VoidCallback onNext;

  SkincareRoutine(this.title, this.onNext);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Icon(Icons.face, size: 100, color: Colors.blue),
          SizedBox(height: 20),
          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Lanjut'),
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}

class BlankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
    );
  }
}
