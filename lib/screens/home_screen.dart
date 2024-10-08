import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_travel_tutorial/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  final String avatarUrl =
      'https://t4.ftcdn.net/jpg/05/62/99/31/360_F_562993122_e7pGkeY8yMfXJcRmclsoIjtOoVDDgIlh.jpg';

  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).colorScheme.secondary
              : const Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          _icons[index],
          size: 25,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : const Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(
            top: 30.0,
            bottom: 10,
          ),
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 120),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry elem) => _buildIcon(elem.key))
                  .toList(),
            ),
            const SizedBox(height: 20),
            const DestinationCarousel(),
            const SizedBox(height: 20),
            const HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: const Color(0xFFB4C1C4),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30,
            ),
            label: '',
          ),
          _currentTab == 2
              ? BottomNavigationBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 13,
                      backgroundImage: NetworkImage(avatarUrl),
                    ),
                  ),
                  label: '',
                )
              : BottomNavigationBarItem(
                  icon: CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(avatarUrl),
                  ),
                  label: '',
                )
        ],
      ),
    );
  }
}
