import 'package:farm_ez/screens/farmers.dart';
import 'package:farm_ez/widgets/farmers_list.dart';
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
                Icon(
                  Icons.access_time_sharp,
                  size: 36,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'Dummy ...',
                  style: TextStyle(
                    fontSize: 28,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.abc,
              size: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'ABC',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'XYZ',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              isStakeHolder ? Icons.energy_savings_leaf : Icons.business,
              size: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              isStakeHolder ? 'Farmer Mode' : 'Stake Holder Mode',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: toggleStakeHolderMode,
          ),
        ],
      ),
    );
  }
}
