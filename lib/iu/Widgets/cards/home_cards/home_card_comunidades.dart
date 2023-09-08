import 'package:flutter/material.dart';

class ComunidadesCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String tipo;
  final List<dynamic> imagenporestado;
  const ComunidadesCard(
      this.image, this.title, this.subtitle, this.tipo, this.imagenporestado,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.red,
      //color: const Color.fromARGB(255, 214, 169, 169),
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
                            )),
                      ),
                      Positioned(
                          right: 25,
                          top: 15,
                          child: SizedBox(
                            height: 200,
                            width: 30,
                            child: ListView.builder(
                              itemCount: imagenporestado.length,
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
                                              image: NetworkImage(
                                                  List.from(imagenporestado)
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
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20)),
                  color: Colors.black45),
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
/* ListView(
                                  children: List.generate(
                                      List.from(imagenporestado)
                                          .toList()
                                          .length, (index) {
                                    return Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  List.from(imagenporestado)
                                                      .toList()[index])),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    );
                                  }),
                                ), */

/* 
                                Wrap(
                              spacing: 5,
                              direction: Axis.vertical,
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              List.from(imagenporestado)
                                                  .toList()[0])),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ],
                            ) */