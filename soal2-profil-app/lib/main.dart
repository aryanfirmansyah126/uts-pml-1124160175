import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';

void main() {
  runApp(const ProfilApp());
}

class ProfilApp extends StatefulWidget {
  const ProfilApp({super.key});

  @override
  State<ProfilApp> createState() => _ProfilAppState();
}

class _ProfilAppState extends State<ProfilApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _ubahTema(bool aktifkanGelap) {
    setState(() {
      _themeMode = aktifkanGelap ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF1565C0);

    return MaterialApp(
      title: 'Profil Aryan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/profile': (context) => ProfilePage(
              isDarkMode: _themeMode == ThemeMode.dark,
              onThemeChanged: _ubahTema,
            ),
      },
    );
  }
}