import 'package:flutter/material.dart';
import 'models/profile.dart';

final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.light)

Profile currentProfile = Profile(
    name: 'Felissa Vivian Margaretha',
    nim: '1124160036',
    prodi: 'Teknik Informatika',
    email: 'vivianmargaret060919@gmail.com',
    phone: '083892085558',
    github: 'https://github.com/FeliiCode',
);
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(valueListenable: themeModeNotifier, builder: (context, currentMode, child) {
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
      )
    }
  }

}