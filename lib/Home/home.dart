// ignore_for_file: unused_field, await_only_futures, avoid_print, unused_local_variable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teve/Home/models/channel_model.dart';
import 'package:teve/Home/screens/fav_screen.dart';
import 'package:teve/Home/service/home_service.dart';
import 'package:teve/Home/ui_view/show_card.dart';
import 'package:teve/Login/login.dart';
import 'package:teve/Player/screens/channels_screen.dart';
import 'package:teve/Player/screens/select_screen.dart';
import 'package:teve/Utils/constants.dart';
import 'package:teve/Utils/teve_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Timer _timer;
  String formattedTime =
      DateFormat("hh:mm a").format(DateTime.now()).toString();
  String formattedDate =
      DateFormat("MMM dd, yyyy").format(DateTime.now()).toString();
  HomeService service = HomeService();
  late Future<List<ChannelModel>> _channels;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    const orientations = [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ];
    SystemChrome.setPreferredOrientations(orientations);
    _channels = service.fetchChannels(context);
    _timer =
        Timer.periodic(const Duration(milliseconds: 500), (timer) => _update());
  }

  void _update() {
    setState(() {
      formattedTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
      formattedDate =
          DateFormat("MMM dd, yyyy").format(DateTime.now()).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: TeveTheme.teveAppBar(
            onFav: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const FavScreen();
              }));
            },
            onSettings: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
            showSettings: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedTime,
                  style: TeveTheme.appText(
                      size: 15, weight: FontWeight.w600, isShadow: true),
                ),
                Text(
                  formattedDate,
                  style: TeveTheme.appText(
                      size: 11, weight: FontWeight.w500, color: Colors.white54),
                ),
              ],
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
            FutureBuilder<List<ChannelModel>>(
              future: _channels,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: AnimationLimiter(
                          child: ListView.builder(
                              itemCount: showModels.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: ((context, index) {
                                List<ChannelModel> channelObjs = [];
                                for (ChannelModel models in snapshot.data!) {
                                  if (models.categories!.isNotEmpty) {
                                    if (models.categories![0].name ==
                                        showModels[index].show_type) {
                                      channelObjs.add(models);
                                    }
                                  }
                                }
                                showModels[index].total_channels = index != 0
                                    ? "${channelObjs.length} Channels"
                                    : "${snapshot.data!.length} Channels";

                                return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(seconds: 1),
                                    child: SlideAnimation(
                                      horizontalOffset: 80.0,
                                      child: FadeInAnimation(
                                          child: GestureDetector(
                                        onTap: () {
                                          if (index == 0 || index == 1) {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: ((context) {
                                              return SelectScreen(
                                                  models: index == 0
                                                      ? snapshot.data!
                                                      : channelObjs,
                                                  topWidget:
                                                      showModels[index].child);
                                            })));
                                          } else {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: ((context) {
                                              return ChannelScreen(
                                                  models: channelObjs,
                                                  topWidget:
                                                      showModels[index].child);
                                            })));
                                          }
                                        },
                                        child: ShowCard(
                                          model: showModels[index],
                                        ),
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
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
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
            "Are you sure you want to LogOut?",
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
            onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.remove("session").then((value) {
                return Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const Login();
                }));
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
