// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:proyecto_peliculas/providers/movie_provider.dart';

import '../models/models.dart';

class CastingCards extends StatelessWidget {
  final Movie pelicula;
  final List<dynamic>? actors;

  const CastingCards({super.key, required this.pelicula, required this.actors});

  @override
  Widget build(BuildContext context) {
    // Implementar media query (Sacar el tamano de la pantalla)
    final size = MediaQuery.of(context).size;

    //final movieProvider = MoviesProvider();
    // ignore: avoid_print
    print("CAsting: ");
    //final actors = movieProvider.getActors(pelicula.id.toString());
    List<CastElement> castMovies = actors!.cast<CastElement>();
    // ignore: avoid_print
    print(castMovies[0].name);

    // ignore: sized_box_for_whitespace
    return Container(
      // Tenga todo el ancho
      width: double.infinity,
      height: size.height * 0.3, // Alto del
      child: Column(
        // Orietacion del TExto
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              "Actores",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Dar la separacion
          const SizedBox(
            height: 10,
          ),
          // Expanded para que ocupe todod el tamano de la columa
          Expanded(
              child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) =>
                _CastingPoster(castMovies: castMovies[index]),
          )),
        ],
      ),
    );
  }
}

// PAra movie poster
// Estamos hacciendo el carrusel de abajo
// ignore: must_be_immutable
class _CastingPoster extends StatelessWidget {
  CastElement castMovies;
  // ignore: unused_element
  _CastingPoster({super.key, required this.castMovies});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 130,
      height: 190,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              // ignore: prefer_const_constructors
              placeholder: NetworkImage('https://via.placeholder.com/300x400'),
              image: NetworkImage(castMovies.getFoto()),
              width: 120,
              height: 155,
              fit: BoxFit.cover,
            ),
          ),
          // Poneer el Texto (Primero ponemos la separacion)
          const SizedBox(
            height: 5,
          ),
          // Si el texto es muy largo para que no de errro hay que ponerle ...
          Text(
            castMovies.name,
            maxLines: 2, // Cuando se parta en 2
            overflow: TextOverflow.ellipsis, // Ponga ... cuando se corte
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
