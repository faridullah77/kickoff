import 'package:flutter/material.dart';

void main() {
  runApp(KickoffApp());
}

class KickoffApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kickoff',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Screens for Bottom Navigation Tabs
  final List<Widget> _screens = [
    MatchesScreen(),
    LeaguesScreen(),
    NewsScreen(),
    FollowingsScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'Matches'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Leagues'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Followings'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}

// Matches Screen
class MatchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Matches Screen', style: TextStyle(color: Colors.white, fontSize: 24)),
    );
  }
}

// Leagues Screen
class LeaguesScreen extends StatelessWidget {
  final List<Map<String, String>> leagues = [
    {'name': 'Premier League', 'icon': '⚽'},
    {'name': 'Champions League', 'icon': '🏆'},
    {'name': 'Championship', 'icon': '📋'},
    {'name': 'LaLiga', 'icon': '🔴'},
    {'name': 'FA Cup', 'icon': '🟥'},
    {'name': 'EURO', 'icon': '🌍'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leagues'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: leagues.map((league) {
          return Card(
            color: Colors.black,
            child: ListTile(
              leading: Text(
                league['icon']!,
                style: TextStyle(fontSize: 24),
              ),
              title: Text(
                league['name']!,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.green),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LeagueDetailScreen(leagueName: league['name']!),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

// League Detail Screen
class LeagueDetailScreen extends StatelessWidget {
  final String leagueName;

  LeagueDetailScreen({required this.leagueName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(leagueName),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          '$leagueName Details',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

// News Screen
class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('News Screen', style: TextStyle(color: Colors.white, fontSize: 24)),
    );
  }
}

// Followings Screen
class FollowingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Followings Screen', style: TextStyle(color: Colors.white, fontSize: 24)),
    );
  }
}

// More Screen
class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.green),
            title: Text('Notifications', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Code to handle Notifications
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.green),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Code to handle Settings
            },
          ),
        ],
      ),
    );
  }
}
