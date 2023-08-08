// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Navigatorbar extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final Function Currentindex;
  // ignore: non_constant_identifier_names
  const Navigatorbar({super.key, required this.Currentindex});

  @override
  State<Navigatorbar> createState() => _NavigatorbarState();
}

class _NavigatorbarState extends State<Navigatorbar> {
  // ignore: non_constant_identifier_names
  int PageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      child: NavigationBar(
          elevation: 0,
          selectedIndex: PageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              PageIndex = index;
              widget.Currentindex(index);
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            NavigationDestination(
              icon: Icon(Icons.local_florist),
              label: 'Especies',
            ),
            NavigationDestination(
              icon: Icon(Icons.groups),
              label: 'Comunidades',
            ),
          ]),
    );
  }
}
