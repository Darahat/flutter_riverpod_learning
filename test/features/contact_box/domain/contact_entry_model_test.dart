import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod_project/features/contact_box/domain/contact_entry_model.dart';

void main() {
  group('TextEntry', () {
    test('should create an object with correct values', () {
      const name = 'Rahat';

      final entry = ContactEntryModel(contact: name);

      expect(entry.contact, name);
    });

    test('should support equality comparison', () {
      final entry1 = ContactEntryModel(contact: 'Alice');
      final entry2 = ContactEntryModel(contact: 'Alice');
      final entry3 = ContactEntryModel(contact: 'Bob');

      expect(entry1, equals(entry2));
      expect(entry1 == entry3, isFalse);
    });
  });
}
