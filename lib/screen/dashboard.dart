import 'package:flutter/material.dart';
import 'package:project_expo/config/asset.dart';
import 'package:project_expo/screen/home_screen.dart';
import 'package:project_expo/screen/calendar_screen.dart';
import 'package:project_expo/screen/profile_screen.dart';
import 'package:project_expo/screen/simpan_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  String _title = '';

  // Tambahkan CalendarScreen dan ProfileScreen ke dalam daftar widget
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CalendarScreen(), // Menambahkan CalendarScreen
    ProfileScreen(), // Menambahkan ProfileScreen
  ];

  @override
  void initState() {
    super.initState();
    _title = 'Beranda'; // Set default title
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          elevation: 2,
          toolbarHeight: 60,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          centerTitle: true,
          title: _title == 'default'
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'PT. Sukses Kawan Sejahtera',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 13, 93, 58),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Text(
                  _title,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Color.fromARGB(255, 13, 93, 58),
          selectedItemColor: Asset.colorPrimary,
          items: [
            BottomNavigationBarItem(
              label: "Beranda",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Kalender",
              icon: Icon(Icons.calendar_today),
            ),
            BottomNavigationBarItem(
              label: "Profil",
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SimpanScreen()))
              .then((value) => (value));
        },
        child: Icon(Icons.map),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _title = 'Beranda';
          break;
        case 1:
          _title = 'Kalender';
          break;
        case 2:
          _title = 'Profil';
          break;
      }
    });
  }
}
