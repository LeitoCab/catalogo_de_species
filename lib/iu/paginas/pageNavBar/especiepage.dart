import 'package:flutter/material.dart';

import '../../Widgets/Appbar.dart';
import '../../Widgets/cards/species and comunity/specie_card.dart';

//import '../../Widgets/Appbar.dart';

class Especies extends StatefulWidget {
  const Especies({super.key});

  @override
  State<Especies> createState() => _EspeciesState();
}

class _EspeciesState extends State<Especies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrincipal(context, 'Especies',
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)), null),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (_, index) {
            return customSpecieCommunitieCard(index);
          },
        ),
      ),
    );
  }
}
