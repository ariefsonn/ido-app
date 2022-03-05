import 'package:flutter/material.dart';
import 'package:ido_app/presentation/pages/home_page.dart';
import 'package:ido_app/presentation/pages/profile_page.dart';
import 'package:ido_app/presentation/pages/track_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  List<Widget> selectedPage = <Widget> [
    const HomePage(),
    const TrackPage(),
    const ProfilePage(),
  ];

  void onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF302B2B),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.track_changes_outlined, color: Colors.white),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, color: Colors.white),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: onItemSelected,
        ),
      ),
      body: selectedPage[_selectedIndex],
    );
  }
}
