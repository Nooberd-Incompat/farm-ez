import 'package:farm_ez/providers/user_farmers.dart';
import 'package:farm_ez/screens/add_farmer.dart';
import 'package:farm_ez/widgets/farmers_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FarmersScreen extends ConsumerStatefulWidget {
  const FarmersScreen({super.key});

  @override
  ConsumerState<FarmersScreen> createState() {
    return _FarmerScreenState();
  }
}

class _FarmerScreenState extends ConsumerState<FarmersScreen> {
  late Future<void> _farmersFuture;

  @override
  void initState() {
    super.initState();
    _farmersFuture = ref.read(userFarmerProvider.notifier).loadFarmers();
  }

  @override
  Widget build(BuildContext context) {
    final userFarmers = ref.watch(userFarmerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Farms"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddFarmerScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _farmersFuture,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : FarmersList(
                      farmers: userFarmers,
                    ),
        ),
      ),
    );
  }
}
