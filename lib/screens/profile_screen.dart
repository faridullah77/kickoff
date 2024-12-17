import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _favoriteClub = "Not Selected";
  String _name = "Not Set";
  String _email = "Not Set";
  String _country = "Not Set";
  String _gender = "Not Set";

  @override
  void initState() {
    super.initState();
    _loadFavoriteClub();
    _loadUserDetails();
  }

  Future<void> _loadFavoriteClub() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteClub = prefs.getString('favoriteClub') ?? "Not Selected";
    });
  }

  Future<void> _loadUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? "Not Set";
      _email = prefs.getString('email') ?? "Not Set";
      _country = prefs.getString('country') ?? "Not Set";
      _gender = prefs.getString('gender') ?? "Not Set";
    });
  }

  void _editUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', 'Muhammad Mahrez');
    await prefs.setString('email', 'mahrez@example.com');
    await prefs.setString('country', 'Pakistan');
    await prefs.setString('gender', 'Male');
    setState(() {
      _name = 'Muhammad Mahrez';
      _email = 'mahrez@example.com';
      _country = 'Pakistan';
      _gender = 'Male';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
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
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: Icon(Icons.person, color: Colors.white, size: 50),
            ),
            SizedBox(height: 15),
            _buildDetailField('Name:', _name),
            _buildDetailField('Email:', _email),
            _buildDetailField('Country:', _country),
            _buildDetailField('Gender:', _gender),
            _buildDetailField('Favorite Club:', _favoriteClub),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: _editUserDetails,
              child: Text('Edit Details'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 05), // Reduced padding
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 15, color: Colors.white70), // Reduced font size
        ),
        SizedBox(height: 8), // Reduced line spacing
        Text(
          value,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        SizedBox(height: 16), // Reduced line spacing
      ],
    );
  }
}
