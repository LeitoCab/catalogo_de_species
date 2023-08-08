// ignore_for_file: file_names
import 'package:catalogo_species/iu/paginas/pageNavBar/comunidpage.dart';
import 'package:catalogo_species/iu/paginas/pageNavBar/especiepage.dart';
import 'package:catalogo_species/iu/paginas/pageNavBar/homepage.dart';
import 'package:flutter/material.dart';

class RoutesN extends StatelessWidget {
  final int index;
  const RoutesN({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      Homepage(),
      Especies(),
      comunidades(),
    ];
    return pages[index];
  }
}
