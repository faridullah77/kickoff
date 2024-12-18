import 'package:flutter/material.dart';

class LeaguesScreen extends StatelessWidget {
  final List<Map<String, String>> leagues = [
    {'name': 'Premier League', 'logo': 'assets/premier_league_logo.png'},
    {'name': 'La Liga', 'logo': 'assets/la_liga_logo.png'},
    {'name': 'Serie A', 'logo': 'assets/serie_a_logo.png'},
    {'name': 'Bundesliga', 'logo': 'assets/bundesliga_logo.png'},
    {'name': 'Ligue 1', 'logo': 'assets/ligue1_logo.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leagues', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Search Leagues...',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.green),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: leagues.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    leagues[index]['logo']!,
                    width: 40,
                    height: 40,
                  ),
                  title: Text(
                    leagues[index]['name']!,
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LeagueTabsScreen(leagueName: leagues[index]['name']!),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LeagueTabsScreen extends StatelessWidget {
  final String leagueName;

  LeagueTabsScreen({required this.leagueName});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('$leagueName', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.green,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Table'),
              Tab(text: 'Fixtures'),
              Tab(text: 'Stats'),
              Tab(text: 'Teams'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PointsTableScreen(leagueName: leagueName),
            FixturesScreen(leagueName: leagueName),
            StatsScreen(leagueName: leagueName),
            TeamStatsScreen(leagueName: leagueName), // Use TeamStatsScreen here
          ],
        ),
      ),
    );
  }
}

class PointsTableScreen extends StatelessWidget {
  final String leagueName;

  PointsTableScreen({required this.leagueName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No data available for $leagueName'),
    );
  }
}

class FixturesScreen extends StatelessWidget {
  final String leagueName;

  FixturesScreen({required this.leagueName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Fixtures for $leagueName'),
    );
  }
}

class StatsScreen extends StatelessWidget {
  final String leagueName;

  StatsScreen({required this.leagueName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Stats for $leagueName'),
    );
  }
}

class TeamStatsScreen extends StatefulWidget {
  final String leagueName;

  TeamStatsScreen({required this.leagueName});

  @override
  _TeamStatsScreenState createState() => _TeamStatsScreenState();
}

class _TeamStatsScreenState extends State<TeamStatsScreen> {
  final List<String> stats = [
    'Goals',
    'GS',
    'Assists',
    'Yellow Cards',
    'Red Cards',
    'Goal Penalty',
    'Shots on Target',
    'Shots',
    'Offside',
    'Corners',
    'Passes',
  ];

  int selectedStatIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Stats'),
        backgroundColor: Colors.green,
      ),
      body: Row(
        children: [
          Container(
            width: 150,
            color: Colors.grey[200],
            child: ListView.builder(
              itemCount: stats.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedStatIndex = index;
                    });
                  },
                  child: Container(
                    color: selectedStatIndex == index
                        ? Colors.green
                        : Colors.transparent,
                    padding: EdgeInsets.all(12),
                    child: Text(
                      stats[index],
                      style: TextStyle(
                        color: selectedStatIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Showing data for ${stats[selectedStatIndex]}',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
