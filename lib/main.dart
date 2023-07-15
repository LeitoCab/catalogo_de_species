import 'package:catalogo_species/iu/colores/global_colors.dart';
import 'package:catalogo_species/iu/paginas/MyApp/Myapp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: kBackgroundColor,
          ),
          scaffoldBackgroundColor: kBackgroundColor,
          navigationBarTheme: const NavigationBarThemeData(
            backgroundColor: AppBarColor,
            indicatorColor: SombraBoton,
          )),
      home: const Myappp(),
    );
  }
}
