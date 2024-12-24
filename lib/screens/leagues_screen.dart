import 'package:flutter/material.dart';

class LeaguesScreen extends StatefulWidget {
  @override
  _LeaguesScreenState createState() => _LeaguesScreenState();
}

class _LeaguesScreenState extends State<LeaguesScreen> {
  String selectedTab = 'Tables'; // Default selected tab
  String selectedLeague = 'Bundesliga'; // Default selected league

  // List of leagues
  final List<String> leagues = [
    'Bundesliga',
    'La Liga',
    'Premier League',
    'Serie A',
    'Ligue 1',
    'Eredivisie',
    'MLS',
    'Portuguese League',
    'Russian Premier League',
    'Turkish Super Lig'
  ];

  // Placeholder club names for the "Tables" tab
  final Map<String, List<String>> clubsByLeague = {
    'Bundesliga': [
      'Bayern Munich', 'Borussia Dortmund', 'RB Leipzig', 'Bayer Leverkusen',
      'Wolfsburg', 'Eintracht Frankfurt', 'Hoffenheim', 'Bayer 04 Leverkusen',
      'VfB Stuttgart', 'Union Berlin', 'Borussia Mönchengladbach', 'FC Augsburg',
      'FC Köln', 'Werder Bremen', 'Mainz 05', 'FC Schalke 04', 'Arminia Bielefeld',
      'FC Freiburg', 'SC Paderborn', 'VfL Bochum'
    ],
    'La Liga': [
      'Real Madrid', 'Barcelona', 'Atletico Madrid', 'Sevilla', 'Real Sociedad',
      'Villarreal', 'Real Betis', 'Athletic Bilbao', 'Granada', 'Getafe',
      'Valencia', 'Celta Vigo', 'Osasuna', 'Levante', 'Espanyol', 'Alavés',
      'Elche', 'Cadiz', 'Mallorca', 'Eibar', 'Huesca'
    ],
    'Premier League': [
      'Manchester City', 'Arsenal', 'Liverpool', 'Chelsea', 'Manchester United',
      'Tottenham Hotspur', 'Newcastle United', 'Aston Villa', 'Brighton & Hove Albion',
      'West Ham United', 'Wolverhampton Wanderers', 'Leeds United', 'Southampton',
      'Everton', 'Crystal Palace', 'Leicester City', 'Nottingham Forest', 'Fulham',
      'Bournemouth', 'Brentford'
    ],
    'Serie A': [
      'Inter Milan', 'AC Milan', 'Juventus', 'Napoli', 'Roma', 'Lazio', 'Atalanta',
      'Fiorentina', 'Torino', 'Bologna', 'Sampdoria', 'Udinese', 'Spezia', 'Empoli',
      'Monza', 'Salernitana', 'Lecce', 'Verona', 'Cagliari', 'Brescia', 'Genoa'
    ],
    'Ligue 1': [
      'PSG', 'Lyon', 'Marseille', 'Monaco', 'Lille', 'Rennes', 'Nice', 'Strasbourg',
      'Brest', 'Reims', 'Lens', 'Montpellier', 'Toulouse', 'Clermont', 'Angers',
      'Nantes', 'Lorient', 'Ajaccio', 'Auxerre', 'Troyes', 'Metz'
    ],
    'Eredivisie': [
      'Ajax', 'PSV Eindhoven', 'Feyenoord', 'AZ Alkmaar', 'Vitesse', 'FC Utrecht',
      'Groningen', 'Heerenveen', 'Willem II', 'Twente', 'RKC Waalwijk', 'Fortuna Sittard',
      'Sparta Rotterdam', 'PEC Zwolle', 'Cambuur', 'Heracles Almelo', 'NEC Nijmegen',
      'FC Emmen', 'FC Volendam', 'Go Ahead Eagles'
    ],
    'MLS': [
      'LA Galaxy', 'Seattle Sounders', 'Inter Miami', 'New York City FC', 'Atlanta United',
      'New York Red Bulls', 'Portland Timbers', 'Philadelphia Union', 'Orlando City SC',
      'Toronto FC', 'Columbus Crew', 'Sporting Kansas City', 'Chicago Fire', 'San Jose Earthquakes',
      'Real Salt Lake', 'Minnesota United', 'FC Dallas', 'DC United', 'Vancouver Whitecaps',
      'Montreal Impact'
    ],
    'Portuguese League': [
      'Porto', 'Benfica', 'Sporting CP', 'Braga', 'Vitória Guimarães', 'Marítimo', 'Boavista',
      'Rio Ave', 'Paços de Ferreira', 'Famalicão', 'Tondela', 'Belenenses', 'Arouca', 'Farense',
      'Gil Vicente', 'Moreirense', 'Estoril Praia', 'Santa Clara', 'Nacional', 'Boavista'
    ],
    'Russian Premier League': [
      'Zenit St Petersburg', 'CSKA Moscow', 'Spartak Moscow', 'Lokomotiv Moscow', 'Krasnodar',
      'Dynamo Moscow', 'Rubin Kazan', 'Sochi', 'Akhmat Grozny', 'Arsenal Tula', 'Ural Yekaterinburg',
      'Krylia Sovetov', 'Rotor Volgograd', 'Orenburg', 'Nizhny Novgorod', 'FC Tambov',
      'Khimki', 'Terek Grozny', 'Ufa', 'Akhmat'
    ],
    'Turkish Super Lig': [
      'Galatasaray', 'Fenerbahçe', 'Beşiktaş', 'Trabzonspor', 'Bursaspor', 'Başakşehir',
      'Antalyaspor', 'Alanyaspor', 'Kasımpaşa', 'Sivasspor', 'Göztepe', 'Denizlispor',
      'Rizespor', 'Yeni Malatyaspor', 'Fatih Karagümrük', 'Kayserispor', 'MKE Ankaragücü',
      'Çaykur Rizespor', 'İstanbul Başakşehir', 'BB Erzurumspor'
    ],
  };

  // UI for the "Tables" tab
  Widget buildTableTab() {
  List<String> clubs = clubsByLeague[selectedLeague] ?? [];

  return Center(
    child: SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Team', style: TextStyle(color: Colors.blue))),
          DataColumn(label: Text('P', style: TextStyle(color: Colors.blue))),
          DataColumn(label: Text('W', style: TextStyle(color: Colors.blue))),
          DataColumn(label: Text('D', style: TextStyle(color: Colors.blue))),
          DataColumn(label: Text('L', style: TextStyle(color: Colors.blue))),
          DataColumn(label: Text('F/A', style: TextStyle(color: Colors.blue))),
          DataColumn(label: Text('Pts', style: TextStyle(color: Colors.blue))),
        ],
        rows: clubs
            .map(
              (club) => DataRow(cells: [
                DataCell(
                  Row(
                    children: [
                      if (club == 'Manchester United') // Check if the club is Manchester United
                        Image.asset(
                          'assets/images/manunited.png', // Path to the image
                          width: 30, // Adjust size as needed
                          height: 30,
                        ),
                        if (club == 'Chelsea')
                        Image.asset(
                          'assets/images/chelsea.png',
                          width: 30,
                          height: 30,
                        ),
                        if (club == 'Liverpool')
                        Image.asset(
                          'assets/images/liverpool.png',
                          width: 30,
                          height: 30,
                        ),
                        if (club == 'Arsenal')
                        Image.asset(
                          'assets/images/arsenal.png',
                          width: 30,
                          height: 30,
                        ),
                        if (club == 'Aston Villa')
                        Image.asset(
                          'assets/images/astonvilla.png',
                          width: 30,
                          height: 30,
                        ),
                        if (club == 'Manchester City')
                        Image.asset(
                          'assets/images/mancity.png',
                          width: 30,
                          height: 30,
                        ),
                        if (club == 'Tottenham Hotspur')
                        Image.asset(
                          'assets/images/spurs.png',
                          width: 30,
                          height: 30,
                        ),
                        if (club == 'Newcastle United')
                        Image.asset(
                          'assets/images/newcastle.png',
                          width: 30,
                          height: 30,
                        ),
                        if (club == 'West Ham United')
                        Image.asset(
                          'assets/images/westham.png',
                          width: 30,
                          height: 30,
                        ),
                        if (club == 'Southampton')
                        Image.asset(
                          'assets/images/southampton.png',
                          width: 30,
                          height: 30,
                        ),
                        if (club == 'Everton')
                        Image.asset(
                          'assets/images/everton.png',
                          width: 30,
                          height: 30,
                        ),
                        if (club == 'Crystal Palace')
                        Image.asset(
                          'assets/images/crystalpalace.png',
                          width: 30,
                          height: 30,
                        ),
                        if (club == 'Fulham')
                        Image.asset(
                          'assets/images/fulham.png',
                          width: 30,
                          height: 30,
                        ),
                      SizedBox(width: 8), // Add space between the logo and the club name
                      Text(club, style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
                DataCell(Text('', style: TextStyle(color: Colors.blue))),
                DataCell(Text('', style: TextStyle(color: Colors.blue))),
                DataCell(Text('', style: TextStyle(color: Colors.blue))),
                DataCell(Text('', style: TextStyle(color: Colors.blue))),
                DataCell(Text('', style: TextStyle(color: Colors.blue))),
                DataCell(Text('', style: TextStyle(color: Colors.blue))),
              ]),
            )
            .toList(),
      ),
    ),
  );
}


  // Placeholder widgets for other tabs
  Widget buildPlaceholderTab(String tabName) {
    return Center(
      child: Text(
        '$tabName content goes here',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('League Stats'),
        backgroundColor: Colors.green,
        elevation: 4,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // League Selector
          Container(
            color: Colors.green.shade700,
            padding: EdgeInsets.symmetric(vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: leagues.map((league) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLeague = league;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      margin: EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        color: selectedLeague == league ? Colors.white : Colors.green.shade700,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          if (selectedLeague == league)
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(2, 2),
                              blurRadius: 5,
                            ),
                        ],
                      ),
                      child: Text(
                        league,
                        style: TextStyle(
                          color: selectedLeague == league ? Colors.green : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          // Tab Navigation
          Container(
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                tabButton('Tables'),
                tabButton('Player'),
                tabButton('Team'),
                tabButton('Fixtures'),
              ],
            ),
          ),
          Expanded(
            // Display content based on the selected tab
            child: selectedTab == 'Tables'
                ? buildTableTab()
                : buildPlaceholderTab(selectedTab),
          ),
        ],
      ),
    );
  }

  // Tab Button Widget
  Widget tabButton(String tabName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = tabName;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selectedTab == tabName ? Colors.white : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          tabName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: selectedTab == tabName ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
