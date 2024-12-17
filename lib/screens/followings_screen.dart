import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FollowingsScreen extends StatefulWidget {
  @override
  _FollowingsScreenState createState() => _FollowingsScreenState();
}

class _FollowingsScreenState extends State<FollowingsScreen> {
  Map<String, List<String>> _leagues = {
    'Premier League': [
      'Manchester United', 'Liverpool', 'Chelsea', 'Arsenal', 'Manchester City',
      'Tottenham Hotspur', 'West Ham United', 'Everton', 'Leicester City',
      'Newcastle United'
    ],
    'La Liga': [
      'Real Madrid', 'Barcelona', 'Atletico Madrid', 'Sevilla', 'Valencia',
      'Real Betis', 'Athletic Bilbao', 'Villarreal', 'Celta Vigo', 'Espanyol'
    ],
    'Bundesliga': [
      'Bayern Munich', 'Borussia Dortmund', 'RB Leipzig', 'Bayer Leverkusen', 'Wolfsburg',
      'Eintracht Frankfurt', 'Union Berlin', 'Freiburg', 'Hoffenheim', 'Bochum'
    ],
    'Serie A': [
      'Juventus', 'Inter Milan', 'AC Milan', 'Napoli', 'AS Roma',
      'Lazio', 'Fiorentina', 'Atalanta', 'Bologna', 'Sampdoria'
    ],
    'Ligue 1': [
      'Paris Saint-Germain', 'Marseille', 'Lyon', 'Monaco', 'Lens',
      'Nice', 'Rennes', 'Montpellier', 'Strasbourg', 'Clermont'
    ],
    'MLS': [
      'Los Angeles FC', 'New York Red Bulls', 'Seattle Sounders', 'Atlanta United',
      'Portland Timbers', 'Philadelphia Union', 'New England Revolution', 'Orlando City',
      'FC Dallas', 'Minnesota United'
    ],
    'Eredivisie': [
      'Ajax', 'PSV Eindhoven', 'Feyenoord', 'AZ Alkmaar', 'Utrecht',
      'Twente', 'Heerenveen', 'Vitesse', 'Groningen', 'Heracles'
    ],
    'Primeira Liga': [
      'Benfica', 'Porto', 'Sporting CP', 'Braga', 'Maritimo',
      'Boavista', 'Portimonense', 'Estoril Praia', 'Tondela', 'Belenenses'
    ],
    'Super Lig': [
      'Galatasaray', 'Fenerbahce', 'Besiktas', 'Trabzonspor', 'Antalyaspor',
      'Istanbul Basaksehir', 'Goztepe', 'Konyaspor', 'Alanyaspor', 'Kasimpasa'
    ],
    'J-League': [
      'Yokohama F. Marinos', 'Kashima Antlers', 'Gamba Osaka', 'Urawa Red Diamonds',
      'Cerezo Osaka', 'Nagoya Grampus', 'Consadole Sapporo', 'Sagan Tosu', 'Shonan Bellmare', 'Sanfrecce Hiroshima'
    ],
  };

  List<String> _selectedLeagues = [];
  String? _favoriteClub;

  @override
  void initState() {
    super.initState();
    _loadFavoriteClub();
  }

  Future<void> _loadFavoriteClub() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteClub = prefs.getString('favoriteClub');
    });
  }

  Future<void> _saveFavoriteClub(String club) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('favoriteClub', club);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Your Favorite Football Club',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.blueGrey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _leagues.keys.length,
          itemBuilder: (context, index) {
            String leagueName = _leagues.keys.elementAt(index);
            List<String> clubNames = _leagues[leagueName]!;

            return ExpansionTile(
              title: Text(leagueName, style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.grey[800],
              children: clubNames.map((club) {
                int clubIndex = clubNames.indexOf(club);
                return ListTile(
                  title: Text(club, style: TextStyle(color: Colors.white)),
                  trailing: Checkbox(
                    value: _favoriteClub == club,
                    onChanged: (value) {
                      if (value == true) {
                        _saveFavoriteClub(club);
                      }
                      setState(() {
                        _favoriteClub = value == true ? club : null;
                      });
                    },
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
