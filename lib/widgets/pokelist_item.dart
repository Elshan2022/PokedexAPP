import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/constants/app_constants.dart';
import 'package:flutter_pokedex_app/model/pokemon_model.dart';
import 'package:flutter_pokedex_app/pages/detail_page.dart';
import 'package:flutter_pokedex_app/widgets/poke_image_and_ball.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goDetailPage(context);
      },
      child: Hero(
        tag: pokemon.id!,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.w),
            ),
          ),
          elevation: 3,
          shadowColor: Colors.white,
          color: Constants.getColorFromType(pokemon.type![0]),
          child: Padding(
            padding: Constants.cardPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.name ?? "N/A",
                  style: Constants.pokeNameStyle,
                ),
                Chip(
                  label: Text(
                    pokemon.type![0],
                    style: Constants.chipStyle,
                  ),
                ),
                Expanded(
                  child: PokeImageAndBall(pokemon: pokemon),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goDetailPage(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: ((context) => DetailPage(pokemon: pokemon)),
      ),
    );
  }
}
