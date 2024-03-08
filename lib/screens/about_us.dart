import 'package:flutter/material.dart';
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
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Card(
              elevation: 4, // Controls the shadow depth of the card
              shape: RoundedRectangleBorder(
                // Defines the shape of the card
                borderRadius: BorderRadius.circular(
                    12), // Adjust the border radius to change the card's corners
                side: const BorderSide(
                    color: Color.fromARGB(255, 173, 237, 206),
                    width: 1), // Optional: Add a border around the card
              ),
              color: const Color.fromARGB(
                  255, 210, 247, 218), // Set the background color of the card
              margin: const EdgeInsets.all(8), // Set the margin around the card
              child: const Padding(
                padding: EdgeInsets.all(15), // Set the padding inside the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Farm EZ is an app, integrated with machine learning, used for easing different stages of farming and harvesting. Our goal is to provide a platform for beginner farmers as well as the experienced ones to utilise the app for utility functions.',
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
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.all(16),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image on the left
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipOval(
                        child: SizedBox(
                          width: 120, // Adjust the width of the image container
                          height:
                              120, // Adjust the height of the image container
                          child: Image.asset(
                            'assets/images/ayush2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Description on the right
                    const Expanded(
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
                              'IOTA core member for app development. Operates in Flutter and Dart. Has experience in home automation apps.',
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
              margin: const EdgeInsets.all(16),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image on the left
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipOval(
                        child: SizedBox(
                          width: 120, // Adjust the width of the image container
                          height:
                              120, // Adjust the height of the image container
                          child: Image.asset(
                            'assets/images/yojith.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Description on the right
                    const Expanded(
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
                              'GSDC core member for app development. Highly proficient in Flutter and Dart. Experienced in various types of apps, including chatroom app.',
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
              margin: const EdgeInsets.all(16),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image on the left
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipOval(
                        child: SizedBox(
                          width: 120, // Adjust the width of the image container
                          height:
                              120, // Adjust the height of the image container
                          child: Image.asset(
                            'assets/images/shrijeet.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Description on the right
                    const Expanded(
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
                              'Matrix core member. Very invested into the learnings and practices of machine learning and data science.',
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
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
