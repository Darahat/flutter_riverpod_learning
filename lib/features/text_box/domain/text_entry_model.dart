import 'package:hive/hive.dart';

part 'text_entry_model.g.dart';

@HiveType(typeId: 0)
class TextEntryModel {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final int? age;

  TextEntryModel({required this.text, required this.age});

  // ✅ Override equality for testing and comparison
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextEntryModel &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          age == other.age;

  @override
  int get hashCode => text.hashCode ^ age.hashCode;
}
