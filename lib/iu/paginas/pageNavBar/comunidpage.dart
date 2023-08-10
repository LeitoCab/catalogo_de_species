import 'package:catalogo_species/iu/Widgets/appbar.dart';
import 'package:catalogo_species/iu/Widgets/cards/species%20and%20comunity/community_card%20copy.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class comunidades extends StatefulWidget {
  const comunidades({
    super.key,
  });

  @override
  State<comunidades> createState() => _comunidadesState();
}

// ignore: camel_case_types
class _comunidadesState extends State<comunidades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrincipal(context, 'Comunidades',
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)), null),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (_, index) {
            return CommunitieCard(index);
          },
        ),
      ),
    );
  }
}
