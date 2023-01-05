// ignore_for_file: must_be_immutable, unused_local_variable, avoid_print, non_constant_identifier_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:teve/Home/models/channel_model.dart';
import 'package:teve/Player/screens/channels_screen.dart';
import 'package:teve/Utils/constants.dart';
import 'package:teve/Utils/teve_theme.dart';

class SelectScreen extends StatefulWidget {
  SelectScreen({super.key, required this.topWidget, required this.models});
  Widget topWidget;
  List<ChannelModel> models;

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  int _current = 0;
  CarouselController buttonCarouselController = CarouselController();

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
                  colors: [TeveTheme.darkBlue, TeveTheme.slightBlue])),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: CarouselSlider.builder(
                    carouselController: buttonCarouselController,
                    itemCount: countryIcons.length,
                    itemBuilder: ((context, index, realIndex) {
                      String country_name = "International";
                      String total_channels = "0";

                      List<ChannelModel> countryChannels =
                          widget.models.where((element) {
                        if (element.countries!.isNotEmpty) {
                          return element.countries![0].code!.toLowerCase() ==
                              countryIcons[index];
                        }
                        return false;
                      }).toList();
                      if (countryChannels.isNotEmpty && index == _current) {
                        for (ChannelModel model in countryChannels) {
                          if (model.countries!.isNotEmpty) {
                            country_name = model.countries![0].name!;
                            break;
                          }
                        }
                        total_channels = countryChannels.length.toString();
                      } else {
                        country_name = "International";
                        total_channels = "0";
                      }

                      return Column(
                        children: [
                          GestureDetector(
                            onTap: index == _current
                                ? () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: ((context) {
                                      return ChannelScreen(
                                          isLive: true,
                                          models: countryChannels,
                                          topWidget: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                widget.topWidget,
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  country_name,
                                                  style: TeveTheme.appText(
                                                      size: 14,
                                                      weight: FontWeight.w500,
                                                      color: TeveTheme
                                                          .logoDarkColor),
                                                )
                                              ]));
                                    })));
                                  }
                                : null,
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: index == _current
                                  ? BoxDecoration(
                                      border: Border.all(
                                          color: TeveTheme.whiteColor,
                                          width: 5),
                                      borderRadius: BorderRadius.circular(70))
                                  : null,
                              child: Image.asset(
                                "assets/images/${countryIcons[index]}.png",
                                fit: BoxFit.fill,
                                height: 120,
                                width: 120,
                              ),
                            ),
                          ),
                          index == _current
                              ? Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 500,
                                          child: Text(
                                            country_name,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TeveTheme.appText(
                                                size: 20,
                                                weight: FontWeight.w600),
                                          ),
                                        ),
                                        Text(
                                          "$total_channels Channels",
                                          style: TeveTheme.appText(
                                              size: 15,
                                              weight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              : const SizedBox()
                        ],
                      );
                    }),
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        aspectRatio: 1,
                        viewportFraction: 0.2,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        initialPage: _current,
                        scrollPhysics: const BouncingScrollPhysics())),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onLongPress: () {
                  buttonCarouselController.animateToPage(_current + 20);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: TeveTheme.logoLightColor),
                onPressed: () => buttonCarouselController.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.linear),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 24,
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: TeveTheme.darkBlue,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Icon(
                  Icons.tv,
                  color: TeveTheme.whiteColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "All",
                  style: TeveTheme.appText(size: 15, weight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  widget.models.length.toString(),
                  style: TeveTheme.appText(size: 15, weight: FontWeight.w600),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
