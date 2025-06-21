import 'package:hive/hive.dart';
import 'package:flutter_riverpod_project/core/constants/hive_constants.dart';
import 'package:flutter_riverpod_project/features/text_box/domain/text_entry_model.dart';

class TextEntryRepository {
  final Box<TextEntryModel> _box = Hive.box<TextEntryModel>(
    HiveConstants.textBox,
  );

  List<TextEntryModel> getEntries() => _box.values.toList();

  Future<void> addEntry(TextEntryModel entry) async {
    await _box.add(entry);
  }
}
