import 'package:flutter/material.dart';

class LeaguesScreen extends StatelessWidget {
  final List<Map<String, String>> leagues = [
    {'name': 'Premier League', 'logo': 'assets/premier_league_logo.png'},
    {'name': 'La Liga', 'logo': 'assets/la_liga_logo.png'},
    {'name': 'Serie A', 'logo': 'assets/serie_a_logo.png'},
    {'name': 'Bundesliga', 'logo': 'assets/bundesliga_logo.png'},
    {'name': 'Ligue 1', 'logo': 'assets/ligue1_logo.png'},
    {'name': 'MLS', 'logo': 'assets/mls_logo.png'},
    {'name': 'Eredivisie', 'logo': 'assets/eredivisie_logo.png'},
    {'name': 'Primeira Liga', 'logo': 'assets/primeira_liga_logo.png'},
    {'name': 'Super Lig', 'logo': 'assets/superlig_logo.png'},
    {'name': 'J-League', 'logo': 'assets/jleague_logo.png'},
    {'name': 'Brazilian Serie A', 'logo': 'assets/brazilian_serie_a_logo.png'},
    {'name': 'Russian Premier League', 'logo': 'assets/russian_premier_league_logo.png'},
    {'name': 'Chinese Super League', 'logo': 'assets/chinese_super_league_logo.png'},
    {'name': 'Argentine Primera División', 'logo': 'assets/argentine_primeradiv_logo.png'},
    {'name': 'Indian Super League', 'logo': 'assets/indian_super_league_logo.png'},
    {'name': 'Turkish Super Lig', 'logo': 'assets/turkish_superlig_logo.png'},
    {'name': 'Australia A-League', 'logo': 'assets/australia_aleague_logo.png'},
    {'name': 'South African Premier Division', 'logo': 'assets/southafrican_premierdiv_logo.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black87, Colors.blueGrey],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search Leagues...',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.green),
                filled: true,
                fillColor: Colors.black54,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
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
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Navigate to the league details with options
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LeagueDetailsScreen(leagueName: leagues[index]['name']!),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LeagueDetailsScreen extends StatelessWidget {
  final String leagueName;

  LeagueDetailsScreen({required this.leagueName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$leagueName Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.blueGrey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PointsTableScreen(leagueName: leagueName),
                      ),
                    );
                  },
                  child: Text('Standings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Results screen
                  },
                  child: Text('Results'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Fixtures screen
                  },
                  child: Text('Fixtures'),
                ),
              ],
            ),
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
    // Here, we will display the points table for the selected league
    // For simplicity, let's assume a fixed points table format for each league.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Points Table - $leagueName',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.blueGrey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            _buildPointsTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsTable() {
    // Sample points table
    return DataTable(
      columns: [
        DataColumn(label: Text('Position', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Club name', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Played', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Won', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Lost', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Drawn', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('GD', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Points', style: TextStyle(color: Colors.white))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('1', style: TextStyle(color: Colors.white))),
          DataCell(Text('Manchester City', style: TextStyle(color: Colors.white))),
          DataCell(Text('15', style: TextStyle(color: Colors.white))),
          DataCell(Text('12', style: TextStyle(color: Colors.white))),
          DataCell(Text('1', style: TextStyle(color: Colors.white))),
          DataCell(Text('1', style: TextStyle(color: Colors.white))),
          DataCell(Text('38', style: TextStyle(color: Colors.white))),
        ]),
        DataRow(cells: [
          DataCell(Text('2', style: TextStyle(color: Colors.white))),
          DataCell(Text('Liverpool', style: TextStyle(color: Colors.white))),
          DataCell(Text('15', style: TextStyle(color: Colors.white))),
          DataCell(Text('11', style: TextStyle(color: Colors.white))),
          DataCell(Text('3', style: TextStyle(color: Colors.white))),
          DataCell(Text('1', style: TextStyle(color: Colors.white))),
          DataCell(Text('36', style: TextStyle(color: Colors.white))),
        ]),
        // More rows can be added as needed
      ],
    );
  }
}
