import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_project/features/contact_box/application/contact_box_controller.dart';
import 'package:flutter_riverpod_project/features/contact_box/infrastructure/contact_entry_repository.dart';
import 'package:flutter_riverpod_project/features/contact_box/domain/contact_entry_model.dart';

final repositoryProvider = Provider<ContactEntryRepository>((ref) {
  return ContactEntryRepository();
});

final contactBoxControllerProvider =
    StateNotifierProvider<ContactBoxController, List<ContactEntryModel>>((ref) {
      final repo = ref.watch(repositoryProvider);
      return ContactBoxController(repo);
    });
