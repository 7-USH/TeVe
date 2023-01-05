// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:teve/Login/login.dart';
import 'package:teve/Utils/teve_theme.dart';

class ErrorPage extends StatefulWidget {
  ErrorPage({super.key, required this.text});
  String text;

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    const orientations = [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ];
    SystemChrome.setPreferredOrientations(orientations);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: TeveTheme.darkBlue,
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    LottieBuilder.asset(
                      "assets/jsons/not_found.json",
                      height: 250,
                      width: 250,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        widget.text,
                        textAlign: TextAlign.center,
                        style: TeveTheme.appText(
                            size: 20, weight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 55,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          end: Alignment.topRight,
                          begin: Alignment.bottomLeft,
                          stops: const [0.0, 1.0],
                          tileMode: TileMode.clamp,
                          colors: [
                            TeveTheme.logoDarkColor,
                            TeveTheme.logoLightColor.withOpacity(0.7)
                          ]),
                      borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                      style: TeveTheme.buttonStyle(
                          backColor: Colors.transparent,
                          borderColor: Colors.transparent),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return const Login();
                        }));
                      },
                      child: Text(
                        "Head to Login Page",
                        style: TeveTheme.appText(
                            size: 16,
                            weight: FontWeight.w600,
                            color: TeveTheme.whiteColor),
                      )),
                )
              ]),
        ),
      ),
    );
  }
}
