import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();
  static const title = "Pokedex";
  static const titleImage = "image/pokeball.png";
  static TextStyle textStyle = TextStyle(
    fontSize: calculateFontSize(48),
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle pokeNameStyle = TextStyle(
    fontSize: calculateFontSize(28),
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle pokeInformLabel = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static const TextStyle pokeInformStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
  );
  static const TextStyle chipStyle = TextStyle(
    fontSize: 21,
    color: Colors.white,
  );
  static const imageWidth = 100;
  static const imageHeigth = 100;
  static double inforPageBallHeight = 0.15.sh;

  static get getAppTitleWidgetHeigth =>
      ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;

  static get getBallSize =>
      ScreenUtil().orientation == Orientation.portrait ? 0.2.sh : 0.2.sw;

  static const EdgeInsets appPadding = EdgeInsets.only(left: 10);

  static calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 1.5).sp;
    }
  }

  static get cardPadding => ScreenUtil().orientation == Orientation.portrait
      ? EdgeInsets.all(12.h)
      : EdgeInsets.all(8.w);

  static get calculateImageAndBallSize =>
      ScreenUtil().orientation == Orientation.portrait ? 0.2.sh : 0.3.sw;

  static const Map<String, Color> _typeColorMap = {
    "Grass": Colors.green,
    "Fire": Colors.redAccent,
    "Water": Colors.blue,
    "Electric": Colors.yellow,
    "Rock": Colors.grey,
    "Ground": Colors.brown,
    "Bug": Colors.lightGreenAccent,
    "Psychic": Colors.indigo,
    "Fighting": Colors.orange,
    "Ghost": Colors.deepPurple,
    "Normal": Colors.black26,
    "Poison": Colors.deepPurpleAccent
  };

  static Color getColorFromType(String type) {
    if (_typeColorMap.containsKey(type)) {
      return _typeColorMap[type] ?? Colors.purple.shade300;
    } else {
      return Colors.purple.shade300;
    }
  }

  static double backIconSize = 24.w;
  static EdgeInsets pokeTypeNamePadding =
      const EdgeInsets.only(right: 13, left: 13);

  static EdgeInsets pokeTypeNameRowPadding = EdgeInsets.only(bottom: 0.02.sh);
  static EdgeInsets pokeTypeNameCoulmnPadding =
      EdgeInsets.symmetric(horizontal: 0.05.sh);

  static EdgeInsets infoColumnPadding =
      const EdgeInsets.symmetric(horizontal: 10);
  static double infoPageImageSize = 0.25.sh;
  static double infoPageLandscapeImageSize = 0.18.sw;
}
