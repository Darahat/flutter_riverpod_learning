import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod_project/app.dart';
import 'package:flutter_riverpod_project/core/constants/hive_constants.dart';
import 'package:flutter_riverpod_project/features/text_box/domain/text_entry_model.dart';
import 'package:flutter_riverpod_project/features/contact_box/domain/contact_entry_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TextEntryModelAdapter());
  await Hive.openBox<TextEntryModel>(HiveConstants.textBox);
  Hive.registerAdapter(ContactEntryModelAdapter());
  await Hive.openBox<ContactEntryModel>(HiveConstants.contactInfoBox);
  runApp(const ProviderScope(child: App()));
}
