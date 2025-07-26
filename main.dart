import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, // Enable Material 3
        brightness: Brightness.light,
        colorSchemeSeed: Colors.deepPurple, // Modern color palette
        fontFamily: 'Roboto', // Clean font (optional, you can customize it)
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple, // Button color
            foregroundColor: Colors.white, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
