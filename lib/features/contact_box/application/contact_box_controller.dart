import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_project/features/contact_box/domain/contact_entry_model.dart';
import 'package:flutter_riverpod_project/features/contact_box/infrastructure/contact_entry_repository.dart';

class ContactBoxController extends StateNotifier<List<ContactEntryModel>> {
  ContactBoxController(this.repository) : super(repository.getEntries());
  final ContactEntryRepository repository;

  Future<void> addEntry({required String contact}) async {
    final entry = ContactEntryModel(contact: contact);
    await repository.addEntry(entry);
    state = repository.getEntries();
  }
}
