import 'package:flutter/material.dart';
import 'screens/main_selection_screen.dart';

void main() {
  runApp(const SilksongApp());
}

class SilksongApp extends StatelessWidget {
  const SilksongApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silksong Companion',
      theme: ThemeData(
        brightness: Brightness.light, // TEMA CLARO

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.light,
        ),

        scaffoldBackgroundColor: const Color(0x80FFFFFF), // FUNDO BRANCO

        appBarTheme: const AppBarTheme(
          backgroundColor:
              Color(0xCCFF0000), // Vermelho com transparência (~80%)
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        cardTheme: const CardThemeData(
          color: Colors.white,
          shadowColor: Colors.black26,
          elevation: 3,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),

        tabBarTheme: const TabBarThemeData(
          labelColor: Colors.black, // Texto do tab selecionado
          unselectedLabelColor: Colors.black54, // Texto do tab não selecionado
          indicatorColor: Colors.white, // Linha de seleção
        ),
      ),
      home: const MainSelectionScreen(),
    );
  }
}
