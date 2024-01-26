import 'package:flutter/material.dart';

class ComunidadesCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String tipo;
  const ComunidadesCard(this.image, this.title, this.subtitle, this.tipo,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 1, color: Colors.red.shade200)),
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 2, color: Colors.red.shade200)),
          2),
      child: SizedBox(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Ink(
                  width: 350,
                  height: 182,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.white),
                  child: Stack(
                    children: [
                      Center(
                        child: SizedBox(
                            width: 180,
                            height: double.infinity,
                            child: Image.network(
                              image,
                              fit: BoxFit.scaleDown,
                            )),
                      ),
                      Positioned(
                          right: 25,
                          top: 15,
                          child: SizedBox(
                            height: 200,
                            width: 30,
                            child: ListView.builder(
                              itemCount: image.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Wrap(
                                  spacing: 7,
                                  direction: Axis.vertical,
                                  children: [
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(List.from(
                                                      List<String>.from(image
                                                          .split(',')
                                                          .map(
                                                              (e) => e.trim())))
                                                  .toList()[index])),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    )
                                  ],
                                );
                              },
                            ),
                          ))
                    ],
                  )),
            ),
            Ink(
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20)),
                  color: Colors.red.shade200),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      tipo,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
