import 'package:hive/hive.dart';

part 'text_entry_model.g.dart';

/// A model class representing a text entry that can be stored in Hive.
///
/// This class is annotated with HiveType to enable Hive storage.
/// The [typeId] must be unique across all your Hive models.
@HiveType(typeId: 0)
class TextEntryModel {
  /// The text content of this entry.
  ///
  /// This field is annotated with [HiveField] to ensure it's persisted.
  /// The field number (0) must be unique within this class and should
  /// not be changed once the model is in use to maintain compatibility.
  @HiveField(0)
  final String text;

  /// Another field for taking age
  @HiveField(1)
  final int age;

  TextEntryModel({required this.text, required this.age});
}
