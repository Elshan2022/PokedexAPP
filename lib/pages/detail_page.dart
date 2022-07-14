import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_pokedex_app/constants/app_constants.dart';
import 'package:flutter_pokedex_app/model/pokemon_model.dart';
import 'package:flutter_pokedex_app/widgets/poke_information.dart';
import 'package:flutter_pokedex_app/widgets/poke_type_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context)
        : _buildLandscape(context);
  }

  Scaffold _buildPortraitBody(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: Constants.appPadding,
              onPressed: () {
                goBack(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: Constants.backIconSize,
              ),
            ),
            PokeTypeName(pokemon: pokemon),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: Image.asset(
                      Constants.titleImage,
                      height: Constants.inforPageBallHeight,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0.12.sh,
                    child: PokeInformation(pokemonModel: pokemon),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: pokemon.id!,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.img ?? "",
                        height: Constants.infoPageImageSize,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold _buildLandscape(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: Constants.appPadding,
              onPressed: () {
                goBack(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: Constants.backIconSize,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PokeTypeName(pokemon: pokemon),
                        Hero(
                          tag: pokemon.id!,
                          child: CachedNetworkImage(
                            imageUrl: pokemon.img ?? "",
                            height: Constants.infoPageLandscapeImageSize,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PokeInformation(pokemonModel: pokemon),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
