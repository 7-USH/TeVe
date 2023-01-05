// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:teve/Home/models/show_model.dart';
import 'package:teve/Utils/teve_theme.dart';

class ShowCard extends StatefulWidget {
  ShowCard({super.key, required this.model});
  ShowModel model;

  @override
  State<ShowCard> createState() => _ShowCardState();
}

class _ShowCardState extends State<ShowCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.only(top: 42, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                offset: const Offset(0.3, 0.1),
                spreadRadius: 3,
                blurRadius: 2)
          ],
          color: TeveTheme.slightDarkBlue,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            widget.model.data,
            color: TeveTheme.logoLightColor,
            size: 60,
          ),
          const SizedBox(
            height: 10,
          ),
          widget.model.child,
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(3)),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.model.total_channels,
                style: TeveTheme.appText(
                    size: 12,
                    weight: FontWeight.w500,
                    color: TeveTheme.whiteColor.withOpacity(0.6)),
              )
            ],
          )
        ],
      ),
    );
  }
}
