// ignore_for_file: file_names

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 57, 119, 172),
              ),
              child: Row(
                children: [
                  Container(
                    width: 65,
                    height: 75,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 200,
                    child: ListTile(
                      title: Text(
                        'AMAZONIA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Guía ilustrada de flora y fauna',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          ListTile(
              leading: const Icon(Icons.brightness_4),
              title: const Text('Modo Oscuro'),
              trailing: Switch(
                  value:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark,
                  onChanged: (bool value) {
                    if (value) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                  })),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Perfil'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuración'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 250,
              height: 2,
              decoration: const BoxDecoration(color: Color(0xFF201A1B)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Text(
              'Conéctate con el IIAP',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: IconButton(
                onPressed: () {
                  launchUrl(Uri.parse(
                      'https://www.google.com/maps/place/Instituto+de+Investigaciones+de+la+Amazon%C3%ADa+Peruana/@-3.7690772,-73.2774157,17z/data=!4m6!3m5!1s0x91ea10271e72f725:0xfb6dde79feef3c8e!8m2!3d-3.7674996!4d-73.2747322!16s%2Fg%2F1tf7nmxj?authuser=0&entry=ttu'));
                },
                icon: const Icon(Icons.location_on_outlined)),
            title: const Text(
              'Carretera Iquito-Nauta',
            ),
            subtitle: const Text(
                'Distrito de San Juan Bautista, Maynas, Loreto, Perú'),
          ),
          ListTile(
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.email_outlined)),
            title: const Text('ciiap@iiap.gob.pe'),
          ),
          const SizedBox(
            height: double.minPositive,
          ),
          Center(
            child: Wrap(
              children: [
                IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse(
                          'https://www.facebook.com/IIAPPERU?_rdc=1&_rdr'));
                    },
                    icon: const Icon(Brandico.facebook_rect)),
                IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse(
                          'https://www.linkedin.com/company/instituto-de-investigaci%C3%B3n-de-la-amazon%C3%ADa-peruana-iiap/'));
                    },
                    icon: const Icon(Brandico.linkedin_rect)),
                IconButton(
                    onPressed: () {
                      launchUrl(
                          Uri.parse('https://www.instagram.com/iiapperu/'));
                    },
                    icon: const Icon(Brandico.instagram_1)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
