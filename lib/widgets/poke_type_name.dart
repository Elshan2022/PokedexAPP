import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/constants/app_constants.dart';
import 'package:flutter_pokedex_app/model/pokemon_model.dart';

class PokeTypeName extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeTypeName({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.pokeTypeNameCoulmnPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: Constants.pokeTypeNameRowPadding,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    pokemon.name ?? "",
                    style: Constants.pokeNameStyle,
                  ),
                ),
                Text(
                  '#${pokemon.num}',
                  style: Constants.pokeNameStyle,
                ),
              ],
            ),
          ),
          Chip(
            label: Text(
              pokemon.type?.join(" , ") ?? "",
              style: Constants.chipStyle,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 1 / 5,
          ),
        ],
      ),
    );
  }
}
