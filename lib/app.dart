import 'package:flutter/material.dart';
import 'package:flutter_riverpod_project/features/text_box/presentation/text_box_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Hive Demo',
      home: const TextBoxScreen(),
    );
  }
}
