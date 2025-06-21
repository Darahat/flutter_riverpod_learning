import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_project/features/text_box/domain/text_entry_model.dart';
import 'package:flutter_riverpod_project/features/text_box/infrastructure/text_entry_repository.dart';

class TextBoxController extends StateNotifier<List<TextEntryModel>> {
  TextBoxController(this.repository) : super(repository.getEntries());
  final TextEntryRepository repository;

  Future<void> addEntry({required String text, required int age}) async {
    final entry = TextEntryModel(text: text, age: age);
    await repository.addEntry(entry);
    state = repository.getEntries();
  }
}
