import 'dart:io';
import 'package:farm_ez/providers/user_farmers.dart';
import 'package:farm_ez/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFarmerScreen extends ConsumerStatefulWidget {
  const AddFarmerScreen({super.key});

  @override
  ConsumerState<AddFarmerScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddFarmerScreen> {
  final _titleController = TextEditingController();
  final _phoneController = TextEditingController();
  File? _selectedImage;

  void _saveFarmer() {
    final enteredText = _titleController.text;
    final enteredPhone = _phoneController.text;
    if (enteredText.isEmpty || enteredPhone.isEmpty || _selectedImage == null) {
      return;
    }
    ref
        .read(userFarmerProvider.notifier)
        .addFarmer(enteredText, _selectedImage!, enteredPhone);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Farmer"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Phone'),
              controller: _phoneController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
              onPressed: _saveFarmer,
              icon: const Icon(Icons.add),
              label: const Text("Add Farmer"),
            ),
          ],
        ),
      ),
    );
  }
}
