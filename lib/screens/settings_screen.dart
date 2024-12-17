import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkModeEnabled = false; // State for Theme Toggle
  bool _isNotificationsEnabled = true; // State for Notifications Toggle
  String _selectedLanguage = 'English'; // State for Language Selection

  // Function to simulate clearing cache
  void _clearCache() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cache Cleared!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Function to show About dialog
  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'My App',
      applicationVersion: '1.0.0',
      applicationIcon: Icon(Icons.settings, size: 40, color: Colors.green),
      children: [
        Text('This is a demo Settings screen for a Flutter app.'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.blueGrey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            // Notifications Toggle
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.green),
              title: Text(
                'Notifications',
                style: TextStyle(color: Colors.white70),
              ),
              trailing: Switch(
                value: _isNotificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _isNotificationsEnabled = value;
                  });
                },
              ),
            ),
            Divider(color: Colors.white38),

            // Dark Mode Toggle
            ListTile(
              leading: Icon(Icons.brightness_6, color: Colors.green),
              title: Text(
                'Dark Mode',
                style: TextStyle(color: Colors.white70),
              ),
              trailing: Switch(
                value: _isDarkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _isDarkModeEnabled = value;
                    // Add theme logic here if needed
                  });
                },
              ),
            ),
            Divider(color: Colors.white38),

            // Language Selector
            ListTile(
              leading: Icon(Icons.language, color: Colors.green),
              title: Text(
                'Language',
                style: TextStyle(color: Colors.white70),
              ),
              trailing: DropdownButton<String>(
                dropdownColor: Colors.black87,
                value: _selectedLanguage,
                items: ['English', 'Urdu', 'Spanish', 'French'].map((language) {
                  return DropdownMenuItem(
                    value: language,
                    child: Text(language, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                },
              ),
            ),
            Divider(color: Colors.white38),

            // Privacy Settings
            ListTile(
              leading: Icon(Icons.security, color: Colors.green),
              title: Text(
                'Privacy',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () {
                // Add privacy settings logic here
              },
            ),
            Divider(color: Colors.white38),

            // Clear Cache Option
            ListTile(
              leading: Icon(Icons.delete_outline, color: Colors.redAccent),
              title: Text(
                'Clear Cache',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: _clearCache,
            ),
            Divider(color: Colors.white38),

            // About Section
            ListTile(
              leading: Icon(Icons.info_outline, color: Colors.green),
              title: Text(
                'About',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: _showAboutDialog,
            ),
            Divider(color: Colors.white38),

            // Log Out Option
            ListTile(
              leading: Icon(Icons.logout, color: Colors.redAccent),
              title: Text(
                'Log Out',
                style: TextStyle(color: Colors.redAccent),
              ),
              onTap: () {
                // Add Log Out functionality here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Logged Out!'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            ),
            Divider(color: Colors.white38),

            // Terms of Use
            ListTile(
              leading: Icon(Icons.description, color: Colors.green),
              title: Text(
                'Terms of Use',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () {
                // Show Terms of Use dialog or navigate to a terms page
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Terms of Use'),
                      content: Text('Here are the terms of use for the app...'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Divider(color: Colors.white38),

            // Send Us Feedback
            ListTile(
              leading: Icon(Icons.feedback, color: Colors.green),
              title: Text(
                'Send Us Feedback',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () {
                // Navigate to feedback form or show feedback dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Send Us Feedback'),
                      content: TextField(
                        decoration: InputDecoration(
                          hintText: 'Your feedback...',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 5,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Submit feedback logic
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Feedback Sent!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          child: Text('Submit'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
