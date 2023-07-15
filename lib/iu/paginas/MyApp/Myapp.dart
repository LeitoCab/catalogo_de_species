// ignore_for_file: file_names

import 'package:catalogo_species/iu/Widgets/NavigatorBar.dart';
import 'package:catalogo_species/iu/rutas/routes_NavBar.dart';
import 'package:flutter/material.dart';

class Myappp extends StatefulWidget {
  const Myappp({super.key});

  @override
  State<Myappp> createState() => _MyapppState();
}

class _MyapppState extends State<Myappp> {
  int selectindex = 1;
  Navigatorbar? navb;

  @override
  void initState() {
    super.initState();
    navb = Navigatorbar(Currentindex: (index) {
      setState(() {
        selectindex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RoutesN(index: selectindex),
      bottomNavigationBar: navb,
    );
  }
}
