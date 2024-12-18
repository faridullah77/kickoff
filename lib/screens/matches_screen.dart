import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  final List<String> leagueNames = [
    'Main',
    'Subscribe',
    'Premier League',
    'La Liga',
    'Bundesliga',
    'Serie A',
    'Ligue 1',
    'Eredivisie',
    'MLS',
    'Super Lig',
    'Primeira Liga',
    'J1 League',
    'Saudi Pro League',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: leagueNames.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Matches',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            isScrollable: true,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: leagueNames
                .map((league) => Tab(
                      text: league,
                    ))
                .toList(),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: TabBarView(
            children: leagueNames.map((league) {
              return Center(
                child: Text(
                  'Fixtures for $league',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
