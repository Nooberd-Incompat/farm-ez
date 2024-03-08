import 'package:flutter/material.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Image(
                image: AssetImage('assets/images/kisan_diwas_poster.jpg'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(),
            SizedBox(
              height: 10,
            ),
            Card(),
          ],
        ),
      ),
    );
  }
}
