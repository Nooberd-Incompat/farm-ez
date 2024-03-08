import 'package:flutter/material.dart';

class FeatureButton extends StatelessWidget {
  const FeatureButton({super.key, required this.icon, required this.label});

  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: icon,
          onPressed: () {},
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
