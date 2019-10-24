import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rider/utils/colors.dart';
import 'package:rider/utils/ui_helpers.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: invertInvertColorsStrong(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 225.0,
                height: 225.0,
                child: Image.asset(
                  'assets/other/splash-screen.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              SpinKitDoubleBounce(
                color: MyColors.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
