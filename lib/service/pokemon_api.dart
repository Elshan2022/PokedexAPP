// ignore_for_file: no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter_pokedex_app/model/pokemon_model.dart';
import 'package:dio/dio.dart';

class PokeApi {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-pokedex/master/pokedex.json";

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = [];
    var response = await Dio().get(_url);
    var pokeList = jsonDecode(response.data)[_PokeEnum.pokemon.name];
    if (pokeList is List) {
      _list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }

    return _list;
  }
}

enum _PokeEnum {
  pokemon,
}
