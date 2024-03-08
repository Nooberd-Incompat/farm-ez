import 'package:farm_ez/widgets/big_card.dart';
import 'package:farm_ez/widgets/feature_button.dart';
import 'package:flutter/material.dart';

class MainContent extends StatelessWidget {
  MainContent({super.key});

  final List<String> imageUrls = [
    'assets/images/kisan_diwas_poster.jpg',
    'assets/images/pm_kisan_yojana.jpg',
    'assets/images/pm_kisan.jpg',
    'assets/images/ gov_schemes.webp'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BigCard(
              imageUrls: imageUrls,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Facilities available',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 3, 43, 1)),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FeatureButton(
                      icon: Icon(Icons.help_outline_rounded),
                      label: 'Crop\nRecommendation',
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    FeatureButton(
                      icon: Icon(Icons.pest_control),
                      label: 'Disease\nDetection',
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    FeatureButton(
                        icon: Icon(Icons.medication),
                        label: 'Fertilizer\nRecommendation')
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Coming Soon ...',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 3, 43, 1)),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FeatureButton(
                      icon: Icon(Icons.water_drop),
                      label: 'Irrigation\nManagement',
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    FeatureButton(
                      icon: Icon(Icons.grass_outlined),
                      label: 'Yield\nManagement',
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    FeatureButton(
                      icon: Icon(Icons.attach_money_outlined),
                      label: 'Marketing',
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
