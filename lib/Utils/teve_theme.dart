import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teve/Utils/error_page.dart';

class TeveTheme {
  static const Color darkBlue = Color(0xff1A1726);
  static const Color slightDarkBlue = Color(0xff232031);
  static const Color slightBlue = Color(0xff242230);
  static const Color whiteColor = Color.fromARGB(255, 255, 255, 255);
  static const Color logoDarkColor = Color(0xff9744F6);
  static const Color logoLightColor = Color(0xffB16FF7);

  static const String iptvURl = "https://iptv-org.github.io/";
  static const String dbURL = "https://web-7-ush.cloud.okteto.net/";

  static TextStyle appText({
    required double size,
    required FontWeight weight,
    FontStyle style = FontStyle.normal,
    Color color = whiteColor,
    bool isShadow = false,
  }) {
    return GoogleFonts.poppins(
        fontSize: size,
        fontWeight: weight,
        fontStyle: style,
        color: color,
        shadows: isShadow
            ? [
                BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0.1, 0.4),
                    spreadRadius: 3,
                    blurRadius: 2)
              ]
            : null);
  }

  static AppBar teveAppBar(
      {Widget child = const SizedBox(),
      bool showSettings = false,
      VoidCallback? onFav,
      VoidCallback? onSettings}) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.ideographic,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: const [0.0, 1.0],
                    tileMode: TileMode.clamp,
                    colors: [
                      TeveTheme.logoDarkColor,
                      TeveTheme.logoLightColor.withOpacity(0.6)
                    ]),
                borderRadius: BorderRadius.circular(20)),
            child: const Center(
              child: Icon(
                Icons.live_tv_rounded,
                color: TeveTheme.darkBlue,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "TeVe",
            style: TeveTheme.appText(
                size: 25, weight: FontWeight.w600, isShadow: true),
          ),
          const SizedBox(
            width: 20,
          ),
          Center(
            child: Container(
              height: 40,
              width: 1.5,
              color: TeveTheme.whiteColor.withOpacity(0.5),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          child,
          const Spacer(),
          showSettings
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: onFav,
                      icon: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: const Icon(
                          Icons.favorite,
                          color: TeveTheme.logoLightColor,
                          size: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: onSettings,
                      icon: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: const Icon(
                          Icons.power_settings_new,
                          color: TeveTheme.logoLightColor,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox()
        ],
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
                colors: [TeveTheme.darkBlue, TeveTheme.slightBlue])),
      ),
    );
  }

  static InputDecoration waInputDecoration(
      {IconData? prefixIcon,
      String? hint,
      Color? bgColor,
      double fontSize = 20,
      Color? borderColor,
      EdgeInsets? padding}) {
    return InputDecoration(
      contentPadding:
          padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      counter: const Offstage(),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: whiteColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.redAccent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderColor ?? whiteColor)),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      fillColor: bgColor ?? slightDarkBlue,
      hintText: hint,
      prefixIcon:
          prefixIcon != null ? Icon(prefixIcon, color: whiteColor) : null,
      hintStyle: appText(size: fontSize, weight: FontWeight.normal),
      filled: true,
    );
  }

  static ButtonStyle buttonStyle(
      {double fontSize = 10,
      FontWeight weight = FontWeight.bold,
      Color fontColor = darkBlue,
      required Color backColor,
      Color borderColor = slightDarkBlue}) {
    return ElevatedButton.styleFrom(
        textStyle: appText(size: fontSize, weight: weight, color: fontColor),
        backgroundColor: backColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: borderColor)));
  }

  static moveToErrorPage(
      {required BuildContext context, required String text}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ErrorPage(text: text);
    }));
  }
}
