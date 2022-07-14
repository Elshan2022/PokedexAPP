// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/constants/app_constants.dart';
import 'package:flutter_pokedex_app/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemonModel;
  const PokeInformation({Key? key, required this.pokemonModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: _infomationPageConstants.borderRadiusLeft,
          topRight: _infomationPageConstants.borderRadiusRight,
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: Constants.infoColumnPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRaw("Name", pokemonModel.name),
            _buildInformationRaw("Height", pokemonModel.height),
            _buildInformationRaw("Weight", pokemonModel.weight),
            _buildInformationRaw("Spawn Time", pokemonModel.spawnTime),
            _buildInformationRaw("Weakness", pokemonModel.weaknesses),
            _buildInformationRaw("Pre Evolution", pokemonModel.prevEvolution),
            _buildInformationRaw("Next Evolution", pokemonModel.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buildInformationRaw(String label, dynamic value) {
    const notValue = 'Not available';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.pokeInformLabel,
        ),
        if ((value is List) && value.isNotEmpty)
          Text(
            value.join(" , "),
            style: Constants.pokeInformStyle,
          )
        else if (value == null)
          const Text(
            notValue,
            style: Constants.pokeInformStyle,
          )
        else
          Text(
            value,
            style: Constants.pokeInformStyle,
          ),
      ],
    );
  }
}

class _infomationPageConstants {
  static final borderRadiusLeft = Radius.circular(10.w);
  static final borderRadiusRight = Radius.circular(10.w);
}
