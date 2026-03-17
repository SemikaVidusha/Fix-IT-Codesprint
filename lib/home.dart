import 'package:codesprint_app/booking_page.dart';
import 'package:codesprint_app/login_page.dart';
// import 'package:codesprint_app/login_page.dart';
import 'package:codesprint_app/splash.dart';
import 'package:flutter/material.dart';
import 'package:codesprint_app/profile.dart';
import 'package:codesprint_app/settings.dart';
import 'package:codesprint_app/about_page.dart';
import 'package:codesprint_app/requests.dart';
import 'package:codesprint_app/message.dart';
import 'package:codesprint_app/Emergency.dart';

void main() {
  runApp(FixItApp());
}

class FixItApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FixIt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(218, 32, 32, 117),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            )
          )
        )
        ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> categories = ['All', 'Plumber', 'Electrician', 'Handyman'];

  void _onItemTapped(int index) {
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RequestsPage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MessagesPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => emergencyPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _buildRequestCard(String title, String imagePath, String time) {
    return Expanded(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePath, height: 100, fit: BoxFit.cover),
              ),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(time, style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 4),
              ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage()));}, child: const Text('Reorder')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFixerCard(String name, String experience, String imagePath) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePath, height: 100, fit: BoxFit.cover),
              ),
              const SizedBox(height: 8),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(experience, style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 4),
              ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage()));}, child: const Text('Book Now')),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FixIt',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color.fromARGB(218, 32, 32, 117),
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu, color: Colors.white),
            onSelected: (value) {
              if (value == 'Profile') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
              } else if (value == 'Settings') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsPage()));
              } else if (value == 'About') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => AboutPage()));
              }else if (value == 'Log_out') {
                Navigator.push(context,MaterialPageRoute(builder: (_)=>LoginPage()));
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(value: 'Profile', child: Text('Profile')),
              const PopupMenuItem(value: 'Settings', child: Text('Settings')),
              const PopupMenuItem(value: 'About', child: Text('About')),
              const PopupMenuItem(value: 'Log_out', child: Text('log out'),)
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a service...',
                filled: true,
                fillColor: const Color.fromARGB(255, 241, 241, 241),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search, color: Color.fromARGB(218, 32, 32, 117)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage()));
            },
          )
        ],
      ),

            const SizedBox(height: 16),
            
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categories.map((c) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Chip(
                    label: Text(c),
                    backgroundColor: const Color.fromARGB(255, 220, 220, 250),
                  ),
                )).toList(),
              ),
            ),
            const SizedBox(height: 24),

            // Recent Requests
            const Text(
              'Recent Requests',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildRequestCard('Leaking sink', 'assets/sink.jpeg', '3 hours ago'),
                const SizedBox(width: 12),
                _buildRequestCard('Broken light', 'assets/light.jpg', '4 hours ago'),
              ],
            ),
            const SizedBox(height: 24),

            // Recommended Fixers
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingPage(),
                  ),
                );
              },
              child: Row(
                children: const [
                  Text(
                    'Recommended Fixers  ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, 
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                ],
              ),
            ),

            const SizedBox(height: 18),
            Row(
              children: [
                _buildFixerCard('Calvin, Plumber', '5 years experience', 'assets/download.png'),
                const SizedBox(width: 12),
                _buildFixerCard('Hugo, Electrician', '7 years experience', 'assets/download.png'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.warning), label: 'Emergency'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: const Color.fromARGB(255, 35, 33, 147),
        unselectedItemColor: Color.fromARGB(255, 111, 108, 108),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}