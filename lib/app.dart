import 'package:flutter/material.dart';
import 'home_Screen.dart';

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        /// Input Decorations Themes
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue.shade200,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue.shade200,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),


        /// Text Themes
        textTheme: TextTheme(
          titleLarge: const TextStyle(
            fontSize: 26, color: Colors.blue, fontWeight: FontWeight.bold, letterSpacing: 0.7
          ),
          titleMedium: TextStyle(
              fontSize: 20, color: Colors.blue.shade400, fontWeight: FontWeight.bold, letterSpacing: 0.7
          ),
          titleSmall: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.7
          ),

          // bodyLarge:
          bodyMedium: TextStyle(fontSize: 18,color: Colors.blue.shade700, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontSize: 16,color: Colors.blue.shade500, fontWeight: FontWeight.bold),
        ),

        /// Elevated Button Themes
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade100,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),

      ///
      home: const HomeScreen(),
    );
  }
}
