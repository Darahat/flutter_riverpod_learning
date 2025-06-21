// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_entry_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactEntryModelAdapter extends TypeAdapter<ContactEntryModel> {
  @override
  final int typeId = 1;

  @override
  ContactEntryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactEntryModel(
      contact: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ContactEntryModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.contact);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactEntryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
