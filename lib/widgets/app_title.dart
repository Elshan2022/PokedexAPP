import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/constants/app_constants.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.getAppTitleWidgetHeigth,
      child: Padding(
        padding: Constants.appPadding,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constants.title,
                style: Constants.textStyle,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                Constants.titleImage,
                width: Constants.getBallSize,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
