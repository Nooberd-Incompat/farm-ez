import 'package:farm_ez/screens/tutorial_screen.dart';
import 'package:farm_ez/widgets/main_content.dart';
import 'package:farm_ez/widgets/main_drawer.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = MainContent();
    var activePageTitle = 'Welcome to Farm EZ !';

    if (_selectedPageIndex == 1) {
      activePage = TutorialScreen();
      activePageTitle = 'Learn and Farm !';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 7, 48, 2),
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          _selectPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Tutorials',
          ),
        ],
      ),
      body: activePage,
    );
  }
}
