import 'package:flutter/material.dart';
import '../domain/text_entry_model.dart';

class TextEntryList extends StatelessWidget {
  final List<TextEntryModel> entries;

  const TextEntryList({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const Center(child: Text('No entries yet.'));
    }

    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (_, index) => ListTile(
        title: Text(entries[index].text),
        subtitle: Text(entries[index].age.toString()),
      ),
    );
  }
}
