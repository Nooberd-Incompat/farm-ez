import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'farm Ez',
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: const Padding(
          padding: EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 0),
          child: Image(
            image: AssetImage('assets/logo/farmez_icon.png'),
          ),
        ),
      ),
    );
  }
}
