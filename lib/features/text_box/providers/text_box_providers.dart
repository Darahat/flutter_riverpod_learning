import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_project/features/text_box/application/text_box_controller.dart';
import 'package:flutter_riverpod_project/features/text_box/infrastructure/text_entry_repository.dart';
import 'package:flutter_riverpod_project/features/text_box/domain/text_entry_model.dart';

final repositoryProvider = Provider<TextEntryRepository>((ref) {
  return TextEntryRepository();
});

final textBoxControllerProvider =
    StateNotifierProvider<TextBoxController, List<TextEntryModel>>((ref) {
      final repo = ref.watch(repositoryProvider);
      return TextBoxController(repo);
    });
