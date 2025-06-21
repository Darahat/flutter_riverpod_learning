import 'package:hive/hive.dart';

part 'contact_entry_model.g.dart';

/// A model class representing a text entry that can be stored in Hive.
///
/// This class is annotated with HiveType to enable Hive storage.
/// The [typeId] must be unique across all your Hive models.
@HiveType(typeId: 1)
class ContactEntryModel {
  /// The Contact content of this entry.
  ///
  /// This field is annotated with [HiveField] to ensure it's persisted.
  /// The field number (0) must be unique within this class and should
  /// not be changed once the model is in use to maintain compatibility.
  @HiveField(0)
  final String contact;

  ContactEntryModel({required this.contact});

  // ✅ Override equality for testing and comparison
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactEntryModel &&
          runtimeType == other.runtimeType &&
          contact == other.contact;

  @override
  int get hashCode => contact.hashCode ^ contact.hashCode;
}
