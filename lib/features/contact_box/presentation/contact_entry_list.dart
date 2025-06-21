import 'package:flutter/material.dart';
import '../domain/contact_entry_model.dart';

class ContactEntryList extends StatelessWidget {
  final List<ContactEntryModel> entries;

  const ContactEntryList({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const Center(child: Text('No entries yet.'));
    }

    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (_, index) => ListTile(title: Text(entries[index].contact)),
    );
  }
}
