import 'package:flutter/material.dart';
import 'models/profile.dart';

final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.light)
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