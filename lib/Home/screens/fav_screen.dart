// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:teve/Home/models/fav_model.dart';
import 'package:teve/Home/service/home_service.dart';
import 'package:teve/Home/ui_view/fav_card.dart';
import 'package:teve/Utils/teve_theme.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  HomeService service = HomeService();
  late Future<List<FavModel>> _channels;
  List<FavModel> models = [];

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    const orientations = [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ];
    SystemChrome.setPreferredOrientations(orientations);
    _channels = service.fetchFavChannels(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TeveTheme.teveAppBar(
          child: Text(
        "My Favorite's",
        style: TeveTheme.appText(size: 18, weight: FontWeight.w600),
      )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                    colors: [TeveTheme.darkBlue, TeveTheme.slightBlue])),
          ),
          FutureBuilder<List<FavModel>>(
            future: _channels,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                models = snapshot.data!;
                return models.isEmpty
                    ? Center(
                        child: Text(
                          "No Channels to Watch!",
                          style: TeveTheme.appText(
                              size: 25, weight: FontWeight.bold),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.9,
                            child: AnimationLimiter(
                              child: ListView.builder(
                                  itemCount: models.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: ((context, index) {
                                    return AnimationConfiguration.staggeredList(
                                        position: index,
                                        duration: const Duration(seconds: 1),
                                        child: SlideAnimation(
                                          horizontalOffset: 80.0,
                                          child: FadeInAnimation(
                                              child: FavCard(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        _buildPopupDialog(
                                                            context,
                                                            model:
                                                                models[index]),
                                              );
                                            },
                                            index: index + 1,
                                            model: models[index],
                                          )),
                                        ));
                                  })),
                            ),
                          ),
                        ),
                      );
              } else {
                return Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                      color: TeveTheme.logoLightColor, size: 30),
                );
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context, {required FavModel model}) {
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
            "Do you want to remove this channel \nfrom your favorite's?",
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
              service
                  .deleteFavChannel(context: context, model: model)
                  .then((value) {
                final snackBar = SnackBar(
                  content: Text(
                    value,
                    style: TeveTheme.appText(size: 12, weight: FontWeight.w500),
                  ),
                  backgroundColor: (TeveTheme.slightBlue),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                setState(() {
                  models.remove(model);
                });
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
