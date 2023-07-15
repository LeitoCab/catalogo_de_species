import 'package:catalogo_species/iu/Widgets/appbar.dart';
import 'package:catalogo_species/iu/Widgets/circleAvatar/circleAvatar.dart';
import 'package:catalogo_species/iu/Widgets/cards/home_cards/home_card_comunidades.dart';
import 'package:catalogo_species/iu/Widgets/cards/home_cards/home_card_especies.dart';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarPrincipal(
            context, 'Amazonía', Icons.search, Icons.account_circle_outlined),
        body: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'categorias',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  categoriacircleAvatar(context, 'assets/especie.png', 'Aves'),
                  categoriacircleAvatar(
                      context, 'assets/mamifero.png', 'Mamiferos'),
                  categoriacircleAvatar(
                      context, 'assets/reptil.png', 'Reptiles'),
                  categoriacircleAvatar(
                      context, 'assets/anfibio.png', 'Anfibios')
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Comunidades indígenas',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward)),
            ),
            Container(
              width: 350,
              height: 228,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  comunidadesCard(
                      context, 'assets/especie.png', 'chivo el que lo lee'),
                  comunidadesCard(
                      context, 'assets/especie.png', 'chivo el que lo lee'),
                  comunidadesCard(
                      context, 'assets/especie.png', 'chivo el que lo lee')
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Especies recomendadas',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Wrap(
                        spacing: 4,
                        direction: Axis.vertical,
                        children: [
                          cardSpecies(),
                          cardSpecies(),
                          cardSpecies(),
                        ],
                      ),
                      Wrap(
                        spacing: 4,
                        direction: Axis.vertical,
                        children: [
                          cardSpecies(),
                          cardSpecies(),
                          cardSpecies(),
                        ],
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ));
  }
}
