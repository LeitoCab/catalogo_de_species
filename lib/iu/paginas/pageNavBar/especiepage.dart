import 'package:flutter/material.dart';

//import '../../Widgets/Appbar.dart';

class Especies extends StatefulWidget {
  const Especies({super.key});

  @override
  State<Especies> createState() => _EspeciesState();
}

class _EspeciesState extends State<Especies> {
  @override
  Widget build(BuildContext context) {
    String? valued;
    List listitem = ['data 1', 'data 2', 'data 3', 'data 4', 'data 5'];
    return Scaffold(
      //appBar: AppBarPrincipal(context, 'Especies', Icons.search, null),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: SizedBox(
                //width: 300,
                child: DropdownButton(
          hint: const Text('Categorias'),
          value: valued,
          onChanged: (valueselect) {
            setState(() {
              valued = valueselect.toString();
            });
          },
          items: listitem.map((valueitem) {
            return DropdownMenuItem(
              value: valueitem,
              child: Text(valueitem),
            );
          }).toList(),
        ))),
      ),
    );
  }
}
