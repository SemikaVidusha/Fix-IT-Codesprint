import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: const Color.fromARGB(218, 32, 32, 117),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'CodeSprint Connect',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'This app is a community service connector, making it easier for users to request urgent help or book essential services like plumbing, electrical work, cleaning, and more.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            Text(
              'Our Mission',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'We aim to bridge the gap between service seekers and providers efficiently and respectfully — especially during urgent situations.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            Text(
              'Version',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text('v1.0.0 (Prototype Build)'),
            SizedBox(height: 20),

            Text(
              'Legal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Terms & Conditions'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                
              },
            ),
            ListTile(
              title: Text('Community Guidelines'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ],
        ),
      ),
      
    );
  }
}
