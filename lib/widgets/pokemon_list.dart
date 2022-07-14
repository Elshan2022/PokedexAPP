import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/model/pokemon_model.dart';
import 'package:flutter_pokedex_app/service/pokemon_api.dart';
import 'package:flutter_pokedex_app/widgets/pokelist_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String error = "Can't Connection";

  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    _pokemonListFuture = PokeApi.getPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> listem = snapshot.data!;
          return GridView.builder(
            itemCount: listem.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount(),
            ),
            itemBuilder: (context, index) {
              return PokeListItem(
                pokemon: listem[index],
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              error,
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  int _crossAxisCount() {
    return ScreenUtil().orientation == Orientation.portrait ? 2 : 3;
  }
}
