import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutUsScreen extends ConsumerStatefulWidget {
  const AboutUsScreen({super.key});

  @override
  ConsumerState<AboutUsScreen> createState() {
    return _AboutUsScreenState();
  }
}

class _AboutUsScreenState extends ConsumerState<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 7, 48, 2),
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Card(
              elevation: 4, // Controls the shadow depth of the card
              shape: RoundedRectangleBorder(
                // Defines the shape of the card
                borderRadius: BorderRadius.circular(
                    12), // Adjust the border radius to change the card's corners
                side: BorderSide(
                    color: Colors.grey,
                    width: 1), // Optional: Add a border around the card
              ),
              color: Colors.greenAccent, // Set the background color of the card
              margin: EdgeInsets.all(8), // Set the margin around the card
              child: Padding(
                padding: EdgeInsets.all(15), // Set the padding inside the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is an app, integrated with machine learning, used for easing different stages of farming and harvesting. Our goal is to provide a platform for beginner farmers and the experienced ones to utilise the app for utility functions.',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Meet the team",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.all(16),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image on the left
                    ClipOval(
                      child: Container(
                        width: 120, // Adjust the width of the image container
                        height: 120, // Adjust the height of the image container
                        child: Image.asset(
                          'assets/images/ayush.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Description on the right
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ayush Kumar',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'IOTA core member for app development. Expert in Flutter and Dart. Experienced in home automation apps',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.all(16),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image on the left
                    ClipOval(
                      child: Container(
                        width: 120, // Adjust the width of the image container
                        height: 120, // Adjust the height of the image container
                        child: Image.asset(
                          'assets/images/yojith.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Description on the right
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yojith Kaustabh',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'GSDC core member for app development. Highly proficient in Flutter and Dart. Experienced in various types of apps, including chatroom app',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.all(16),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image on the left
                    ClipOval(
                      child: Container(
                        width: 120, // Adjust the width of the image container
                        height: 120, // Adjust the height of the image container
                        child: Image.asset(
                          'assets/images/shrijeet.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Description on the right
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shrijeet Kumar',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Matrix core member. Very invested into the learnings and practices of machine learning and data science',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
