import 'package:farm_ez/widgets/main_content.dart';
import 'package:farm_ez/widgets/main_drawer.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(
              height: 60,
              width: 60,
              child: Padding(
                padding: EdgeInsets.only(top: 6, bottom: 6, left: 0, right: 5),
                child: Image(
                  image: AssetImage('assets/logo/farmez_icon.png'),
                ),
              ),
            ),
            Text(
              'FARM EZ',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'xyz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'pqr',
          ),
        ],
      ),
      body: MainContent(),
    );
  }
}
