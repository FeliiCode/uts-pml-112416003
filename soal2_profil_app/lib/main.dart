import 'package:flutter/material.dart';
import 'models/profile.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';
import 'screens/edit_profile_page.dart';
import 'screens/about_page.dart';

// 1. Ditambahkan titik koma (;) di akhir
final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.light);

// 2. Diperbaiki: 'profile' diganti 'Profile' (huruf kapital)
// 3. Parameter disesuaikan dengan model Profile (hp, kelas, bio)
Profile currentProfile = Profile(
  name: 'Felissa Vivian Margaretha',
  nim: '1124160036',
  prodi: 'Software Engineering',
  kelas: 'SH SE TI 24',
  bio: 'Software Engineering Student & Mobile Developer',
  email: 'vivianmargaret060919@gmail.com',
  phone: '083892085558',
  github: 'https://github.com/FeliiCode',
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, currentMode, child) {
        return MaterialApp(
          title: 'Profile App',
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.indigo,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
            useMaterial3: true,
          ),
          initialRoute: '/login',
          // 4. Melengkapi seluruh routes yang dibutuhkan aplikasi
          routes: {
            '/login': (context) => const LoginPage(),
            '/profile': (context) => const ProfilePage(),
            '/edit_profile': (context) => const EditProfilePage(),
            '/about': (context) => const AboutPage(),
          },
        ); // <-- Ditambahkan titik koma
      },
    ); // <-- Ditambahkan titik koma
  }
}