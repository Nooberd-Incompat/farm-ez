import 'package:farm_ez/models/farmer.dart';
import 'package:flutter/material.dart';

class FarmerDetailScreen extends StatelessWidget {
  const FarmerDetailScreen({super.key, required this.farmer});

  final Farmer farmer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(farmer.title),
      ),
      body: Stack(
        children: [
          Text(
            "Phone: " + farmer.phone,
          ),
          Image.file(
            farmer.image,
            fit: BoxFit.contain,
            height: double.infinity,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
