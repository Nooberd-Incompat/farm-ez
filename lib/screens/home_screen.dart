import 'package:farm_ez/widgets/main_content.dart';
import 'package:farm_ez/widgets/main_drawer.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to Farm EZ !',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 1, 66, 3),
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {},
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
      body: MainContent(),
    );
  }
}
