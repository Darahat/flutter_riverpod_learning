import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_project/features/contact_box/presentation/contact_box_screen.dart';
import 'package:flutter_riverpod_project/features/product_box/presentation/product_box_screen.dart';

import '../presentation/text_entry_list.dart';
import '../providers/text_box_providers.dart';

class TextBoxScreen extends ConsumerStatefulWidget {
  const TextBoxScreen({super.key});

  @override
  ConsumerState<TextBoxScreen> createState() => _TextBoxScreenState();
}

class _TextBoxScreenState extends ConsumerState<TextBoxScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final entries = ref.watch(textBoxControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Hive + Riverpod Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Enter Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'Enter Age'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final name = _nameController.text.trim();
                final age = _ageController.text.trim();
                if (name.isNotEmpty && age.isNotEmpty) {
                  await ref
                      .read(textBoxControllerProvider.notifier)
                      .addEntry(text: name, age: int.parse(age));
                  _nameController.clear();
                  _ageController.clear();
                }
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactBoxScreen(),
                  ),
                );
              },
              child: const Text('Contact Box'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductBoxScreen(),
                  ),
                );
              },
              child: const Text('Products List'),
            ),
            Expanded(child: TextEntryList(entries: entries)),
          ],
        ),
      ),
    );
  }
}
