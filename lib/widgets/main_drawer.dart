import 'package:farm_ez/screens/about_us.dart';
import 'package:farm_ez/screens/farmers.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({
    super.key,
  });

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool isStakeHolder = false;

  void toggleStakeHolderMode() {
    setState(() {
      isStakeHolder = !isStakeHolder;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FarmersScreen(),
        ),
      );
    });
    // You can add code here to handle toggling dark mode in your app
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                const Image(
                  image: AssetImage(
                    'assets/logo/farmez_icon.png',
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'Farm EZ',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              size: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Profile',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.business,
              size: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Stake Holder Mode',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: toggleStakeHolderMode,
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              size: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'About us',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AboutUsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
