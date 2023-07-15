import 'package:flutter/material.dart';

import '../../Widgets/Appbar.dart';

class Recetas extends StatelessWidget {
  const Recetas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrincipal(context, 'Recetas', Icons.search, null),
      body: const Center(
        child: Text(
          'Recetas',
        ),
      ),
    );
  }
}
