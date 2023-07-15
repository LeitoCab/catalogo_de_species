import 'package:catalogo_species/iu/Widgets/appbar.dart';
import 'package:catalogo_species/iu/Widgets/cards/species/communitie_card/specie_communitie_card.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class comunidades extends StatefulWidget {
  const comunidades({super.key});

  @override
  State<comunidades> createState() => _comunidadesState();
}

// ignore: camel_case_types
class _comunidadesState extends State<comunidades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarPrincipal(context, 'Comunidades', Icons.search, null),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              customSpecieCommunitieCard(
                  context, '', 'title', 'subtitle1', 'subtitle2', 'subtitle3'),
              customSpecieCommunitieCard(
                  context, '', 'title', 'subtitle1', 'subtitle2', 'subtitle3'),
              customSpecieCommunitieCard(
                  context, '', 'title', 'subtitle1', 'subtitle2', 'subtitle3'),
              customSpecieCommunitieCard(
                  context, '', 'title', 'subtitle1', 'subtitle2', 'subtitle3'),
              customSpecieCommunitieCard(
                  context, '', 'title', 'subtitle1', 'subtitle2', 'subtitle3'),
              customSpecieCommunitieCard(
                  context, '', 'title', 'subtitle1', 'subtitle2', 'subtitle3'),
              customSpecieCommunitieCard(
                  context, '', 'title', 'subtitle1', 'subtitle2', 'subtitle3'),
              customSpecieCommunitieCard(
                  context, '', 'title', 'subtitle1', 'subtitle2', 'subtitle3'),
            ],
          ),
        ));
  }
}
