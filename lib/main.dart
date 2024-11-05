import 'package:flutter/material.dart';
import 'package:skin_vault/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skin Vault',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF1e293b),      
          onPrimary: Colors.white,         
          secondary: Color(0xFFfcd34d),    
          onSecondary: Color(0xFF1e293b),  
          error: Color(0xFFef4444),        
          onError: Colors.white,           
          background: Color(0xFF212121),   
          onBackground: Color(0xFF1e293b), 
          surface: Colors.white,           
          onSurface: Color(0xFF1e293b),    
        ),
        
        // Konfigurasi tambahan tema
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1e293b),
          foregroundColor: Colors.white,
          elevation: 8,
        ),
        
        // Konfigurasi kartu
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        
        // Konfigurasi tombol
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFfcd34d),
            foregroundColor: Color(0xFF1e293b),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        
        // Konfigurasi teks
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Color(0xFFfcd34d),
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: Color(0xFF1e293b),
          ),
        ),
        
        // Menggunakan Material 3
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}