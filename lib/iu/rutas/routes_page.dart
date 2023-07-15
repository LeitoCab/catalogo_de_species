import 'package:catalogo_species/iu/paginas/pageNavBar/homepage.dart';
import 'package:catalogo_species/iu/rutas/routes_class.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext context)> get routes {
  return {Routes.home: (context) => const Homepage()};
}
