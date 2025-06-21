import 'package:hive/hive.dart';
import 'package:flutter_riverpod_project/core/constants/hive_constants.dart';
import 'package:flutter_riverpod_project/features/contact_box/domain/contact_entry_model.dart';

class ContactEntryRepository {
  final Box<ContactEntryModel> _box = Hive.box<ContactEntryModel>(
    HiveConstants.contactInfoBox,
  );

  List<ContactEntryModel> getEntries() => _box.values.toList();

  Future<void> addEntry(ContactEntryModel entry) async {
    await _box.add(entry);
  }
}
