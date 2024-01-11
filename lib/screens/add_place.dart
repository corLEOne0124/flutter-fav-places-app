import 'dart:io';
import 'package:favplaces/providers/user_places.dart';
import 'package:favplaces/widgets/image_input.dart';
import 'package:favplaces/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  AddPlaceScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle, _selectedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
                controller: _titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              const SizedBox(height: 10),
              ImageInput(
                onPickImage: (image) {
                  _selectedImage = image;
                },
              ),
              const SizedBox(height: 10),
              LocationInput(),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _savePlace,
                label: const Text('Add Place'),
                icon: const Icon(Icons.add),
              ),
            ],
          )),
    );
  }
}
