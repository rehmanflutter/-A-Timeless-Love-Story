import 'package:flutter/material.dart';
import 'core/theme/amore_theme.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'url_strategy_stub.dart'
    if (dart.library.html) 'url_strategy_web.dart';

void main() {
  configureUrlStrategy(); // web pe path URL, iOS/Android pe no-op
  runApp(const AmoreApp());
}

class AmoreApp extends StatelessWidget {
  const AmoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amore — A Timeless Love Story',
      debugShowCheckedModeBanner: false,
      theme: AmoreTheme.theme,
      home: const HomeScreen(),
    );
  }
}
