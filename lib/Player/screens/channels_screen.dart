// ignore_for_file: must_be_immutable, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:teve/Home/models/channel_model.dart';
import 'package:teve/Player/models/channel_card_model.dart';
import 'package:teve/Player/player.dart';
import 'package:teve/Player/service/player_service.dart';
import 'package:teve/Player/ui_view/channel_card.dart';

import '../../Utils/teve_theme.dart';

class ChannelScreen extends StatefulWidget {
  ChannelScreen(
      {super.key,
      required this.topWidget,
      required this.models,
      this.isLive = false});
  Widget topWidget;
  List<ChannelModel> models;
  bool isLive;

  @override
  State<ChannelScreen> createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  PlayerService service = PlayerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TeveTheme.teveAppBar(child: widget.topWidget),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                  colors: [TeveTheme.darkBlue, TeveTheme.slightDarkBlue])),
        ),
        widget.models.isEmpty
            ? Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/jsons/not_found.json',
                        height: 180, width: 180),
                    Text(
                      "Ops, No Channels to Watch",
                      style: TeveTheme.appText(
                          size: 20, weight: FontWeight.w600, isShadow: true),
                    ),
                  ],
                ),
              )
            : AnimationLimiter(
                child: GridView.count(
                  key: const PageStorageKey<String>('GridView'),
                  crossAxisCount: 4,
                  padding: const EdgeInsets.all(10),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.8,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(widget.models.length, (index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(seconds: 1, milliseconds: 500),
                      columnCount: 4,
                      child: SlideAnimation(
                        horizontalOffset: 80.0,
                        child: FadeInAnimation(
                          child: ChannelCard(
                              onFav: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildPopupDialog(context,
                                          model: widget.models[index]),
                                );
                              },
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return Player(
                                      video_url: widget.models[index].url!);
                                }));
                              },
                              isLive: widget.isLive,
                              model: ChannelCardModel(
                                  channel_category: widget
                                          .models[index].categories!.isNotEmpty
                                      ? widget
                                          .models[index].categories![0].name!
                                      : "Entertainment",
                                  channel_name: widget.models[index].name!,
                                  code: widget
                                          .models[index].countries!.isNotEmpty
                                      ? widget.models[index].countries![0].code!
                                      : "International",
                                  image_url: widget.models[index].logo != null
                                      ? widget.models[index].logo!
                                      : "https://i.imgur.com/rzrOS3N.png",
                                  languages: widget
                                          .models[index].languages!.isNotEmpty
                                      ? widget.models[index].languages![0].name!
                                      : "None")),
                        ),
                      ),
                    );
                  }),
                ),
              )
      ]),
    );
  }

  Widget _buildPopupDialog(BuildContext context,
      {required ChannelModel model}) {
    return AlertDialog(
      backgroundColor: TeveTheme.slightDarkBlue,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Do you want to add this channel \nto your favorite's?",
            style: TeveTheme.appText(
                size: 15, weight: FontWeight.w500, color: TeveTheme.whiteColor),
          ),
        ],
      ),
      actions: <Widget>[
        SizedBox(
          width: 100,
          child: ElevatedButton(
            style: TeveTheme.buttonStyle(backColor: TeveTheme.logoLightColor),
            onPressed: () {
              service.addToFav(context: context, model: model).then((value) {
                final snackBar = SnackBar(
                  content: Text(
                    value,
                    style: TeveTheme.appText(size: 12, weight: FontWeight.w500),
                  ),
                  backgroundColor: (TeveTheme.slightBlue),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.of(context).pop();
              });
            },
            child: const Text('Yes'),
          ),
        ),
        SizedBox(
          width: 100,
          child: ElevatedButton(
            style: TeveTheme.buttonStyle(backColor: TeveTheme.logoLightColor),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No'),
          ),
        ),
      ],
    );
  }
}
