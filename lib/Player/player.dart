// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:teve/Utils/teve_theme.dart';

class Player extends StatefulWidget {
  Player({super.key, required this.video_url});
  String video_url;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  var betterPlayerConfiguration = BetterPlayerConfiguration(
    controlsConfiguration: BetterPlayerControlsConfiguration(
      textColor: Colors.white,
      iconsColor: Colors.white,
      enableFullscreen: false,
      overflowModalColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      loadingWidget: Center(
        child: LoadingAnimationWidget.fourRotatingDots(
            color: TeveTheme.logoLightColor, size: 30),
      ),
      showControlsOnInitialize: true,
      showControls: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: SafeArea(
          child: BetterPlayer.network(widget.video_url,
              betterPlayerConfiguration: betterPlayerConfiguration),
        ),
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        });
  }
}
