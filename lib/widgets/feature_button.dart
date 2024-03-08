import 'package:farm_ez/widgets/webpage_viewer.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class FeatureButton extends StatelessWidget {
  const FeatureButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.link,
      required this.title});

  final Icon icon;
  final String label;
  final String link;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: icon,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => WebPageViewer(
                  url: link,
                  title: title,
                ),
              ),
            );
          },
          color: const Color.fromARGB(255, 1, 88, 23),
          iconSize: 50,
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 11, color: Color.fromARGB(255, 13, 66, 1)),
        ),
      ],
    );
  }
}
