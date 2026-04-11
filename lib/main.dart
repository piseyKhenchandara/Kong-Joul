import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const VeloToulouseApp());
}

class VeloToulouseApp extends StatelessWidget {
  const VeloToulouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VeloToulouse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
