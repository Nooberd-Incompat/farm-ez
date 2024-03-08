import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:farm_ez/models/farmer.dart';
import 'package:farm_ez/providers/user_farmers.dart';
import 'package:farm_ez/screens/farmer_details.dart';

class FarmersList extends StatelessWidget {
  const FarmersList({Key? key, required this.farmers}) : super(key: key);

  final List<Farmer> farmers;

  @override
  Widget build(BuildContext context) {
    if (farmers.isEmpty) {
      return Center(
        child: Text(
          "No farmers added yet",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          radius: 50,
          backgroundImage: FileImage(farmers[index].image),
        ),
        title: Text(
          farmers[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => FarmerDetailScreen(farmer: farmers[index]),
            ),
          );
        },
      ),
      itemCount: farmers.length,
    );
  }
}
