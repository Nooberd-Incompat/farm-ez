import 'package:farm_ez/widgets/feature_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Card(
              child: Image(
                image: AssetImage('assets/images/kisan_diwas_poster.jpg'),
              ),
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
                    color: Color.fromARGB(255, 3, 43, 1)),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FeatureButton(
                      icon: Icon(Icons.recommend),
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
            const Card(),
          ],
        ),
      ),
    );
  }
}
