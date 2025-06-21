import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod_project/features/text_box/domain/text_entry_model.dart';

void main() {
  group('TextEntry', () {
    test('should create an object with correct values', () {
      const name = 'Rahat';
      const age = 25;

      final entry = TextEntryModel(text: name, age: age);

      expect(entry.text, name);
      expect(entry.age, age);
    });

    test('should support equality comparison', () {
      final entry1 = TextEntryModel(text: 'Alice', age: 30);
      final entry2 = TextEntryModel(text: 'Alice', age: 30);
      final entry3 = TextEntryModel(text: 'Bob', age: 35);

      expect(entry1, equals(entry2));
      expect(entry1 == entry3, isFalse);
    });
  });
}
