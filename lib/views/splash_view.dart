import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          FlareActor("assets/animation.flr", alignment: Alignment.center, fit: BoxFit.contain, animation: "Untitled"),
    );
  }
}
