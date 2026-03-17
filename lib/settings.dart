import 'package:codesprint_app/about_page.dart';
// import 'package:codesprint_app/home.dart';
import 'package:codesprint_app/login_page.dart';
// import 'package:codesprint_app/login_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool notificationsEnabled = true;
  bool locationAccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Dark Mode'),
            value: isDarkMode,
            onChanged: (val) {
              setState(() {
                isDarkMode = val;
              });
              MaterialApp(
                theme: ThemeData(
                  brightness: Brightness.light,
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark
                ),
                themeMode: ThemeMode.dark,
              );
            },
          ),
          SwitchListTile(
            title: Text('Notifications'),
            value: notificationsEnabled,
            onChanged: (val) {
              setState(() {
                notificationsEnabled = val;
              });
            },
          ),
          SwitchListTile(
            title: Text('Location Access'),
            value: locationAccess,
            onChanged: (val) {
              setState(() {
                locationAccess = val;
              });
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AboutPage()));
            },
          ),
          ListTile(
            title: Text('Log Out'),
            trailing: Icon(Icons.logout),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(child: Text('App Version: v1.0.0')),
          )
        ],
      ),
    );
  }
}
