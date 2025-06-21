import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/contact_box_providers.dart';
import '../presentation/contact_entry_list.dart';

class ContactBoxScreen extends ConsumerStatefulWidget {
  const ContactBoxScreen({super.key});

  @override
  ConsumerState<ContactBoxScreen> createState() => _ContactBoxScreenState();
}

class _ContactBoxScreenState extends ConsumerState<ContactBoxScreen> {
  final _contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final entries = ref.watch(contactBoxControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Hive + Riverpod Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _contactController,
              decoration: const InputDecoration(labelText: 'Enter Name'),
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final contact = _contactController.text.trim();

                if (contact.isNotEmpty) {
                  await ref
                      .read(contactBoxControllerProvider.notifier)
                      .addEntry(contact: contact);
                  _contactController.clear();
                }
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Expanded(child: ContactEntryList(entries: entries)),
          ],
        ),
      ),
    );
  }
}
