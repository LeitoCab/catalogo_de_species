import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:catalogo_species/iu/paginas/MyApp/Myapp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        dark: ThemeData.dark(),
        light: ThemeData.light(),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darktheme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: darktheme,
            theme: theme,
            home: const Myappp(),
          );
        });
  }
}
