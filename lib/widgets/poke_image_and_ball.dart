import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/constants/app_constants.dart';
import 'package:flutter_pokedex_app/model/pokemon_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokeImageAndBall extends StatelessWidget {
  const PokeImageAndBall({Key? key, required this.pokemon}) : super(key: key);
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Stack(
        children: [
          Image.asset(
            Constants.titleImage,
            width: Constants.calculateImageAndBallSize,
            height: Constants.calculateImageAndBallSize,
            fit: BoxFit.fitHeight,
          ),
          CachedNetworkImage(
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: pokemon.img ?? "Not'fount image",
            width: Constants.calculateImageAndBallSize,
            height: Constants.calculateImageAndBallSize,
            fit: BoxFit.fitHeight,
            placeholder: (context, url) => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
