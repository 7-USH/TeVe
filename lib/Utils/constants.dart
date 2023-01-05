import 'package:teve/Home/models/show_model.dart';
import 'package:flutter/material.dart';
import 'package:teve/Utils/teve_theme.dart';

List<ShowModel> showModels = [
  ShowModel(
      total_channels: "2002 Channels",
      show_type: "Live",
      data: Icons.connected_tv,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Live",
              style: TeveTheme.appText(
                  size: 20, weight: FontWeight.w600, isShadow: true),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            "Tv",
            style: TeveTheme.appText(
                size: 20, weight: FontWeight.w600, isShadow: true),
          )
        ],
      )),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.newspaper,
      show_type: "News",
      child: Text(
        "News",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      )),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.movie,
      show_type: "Movies",
      child: Text(
        "Movies",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      )),
  ShowModel(
      total_channels: "2002 Series",
      data: Icons.music_note_outlined,
      show_type: "Music",
      child: Text(
        "Music",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      )),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.card_travel_outlined,
      child: Text(
        "Auto",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Auto'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.business,
      child: Text(
        "Business",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Business'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.theater_comedy,
      child: Text(
        "Comedy",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Comedy'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.theaters,
      child: Text(
        "Documentary",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Documentary'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.cast_for_education,
      child: Text(
        "Education",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Education'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.movie_filter_sharp,
      child: Text(
        "Entertainment",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Entertainment'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.family_restroom,
      child: Text(
        "Family",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Family'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.style,
      child: Text(
        "Fashion",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Fashion'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.dinner_dining,
      child: Text(
        "Food",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Food'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.abc,
      child: Text(
        "General",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'General'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.health_and_safety,
      child: Text(
        "Health",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Health'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.history_edu,
      child: Text(
        "History",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'History'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.games,
      child: Text(
        "Hobby",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Hobby'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.child_friendly,
      child: Text(
        "Kids",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Kids'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.policy,
      child: Text(
        "Legislative",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Legislative'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.monitor_heart_rounded,
      child: Text(
        "Lifestyle",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Lifestyle'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.local_activity,
      child: Text(
        "Local",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Local'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.temple_buddhist,
      child: Text(
        "Religious",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Religious'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.shop,
      child: Text(
        "Shops",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Shops'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.sports,
      child: Text(
        "Sports",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Sports'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.travel_explore,
      child: Text(
        "Travel",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Travel'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.sunny,
      child: Text(
        "Weather",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Weather'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.local_attraction,
      child: Text(
        "Adult",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'XXX'),
  ShowModel(
      total_channels: "2002 Movies",
      data: Icons.outbond_sharp,
      child: Text(
        "Other",
        style: TeveTheme.appText(
            size: 20, weight: FontWeight.w600, isShadow: true),
      ),
      show_type: 'Other'),
];

List<String> countryIcons = [
  "ae",
  "af",
  "al",
  "am",
  "ao",
  "ar",
  "at",
  "au",
  "aw",
  "az",
  "ba",
  "bb",
  "bd",
  "be",
  "bf",
  "bg",
  "bh",
  "bn",
  "bo",
  "br",
  "by",
  "ca",
  "cd",
  "ch",
  "ci",
  "cl",
  "cm",
  "cn",
  "co",
  "cr",
  "cw",
  "cr",
  "cw",
  "cy",
  "cz",
  "de",
  "dk",
  "do",
  "dz",
  "ec",
  "ee",
  "eg",
  "eh",
  "es",
  "et",
  "fi",
  "fj",
  "fo",
  "fr",
  "ge",
  "gh",
  "gm",
  "gq",
  "gr",
  "gy",
  "hk",
  "hn",
  "hr",
  "hu",
  "id",
  "ie",
  "il",
  "in",
  "ir",
  "is",
  "it",
  "jm",
  "jo",
  "jp",
  "ke",
  "kg",
  "kh",
  "kn",
  "kp",
  "kr",
  "kw",
  "kz",
  "la",
  "lb",
  "li",
  "lk",
  "lt",
  "lu",
  "lv",
  "ly",
  "ma",
  "md",
  "me",
  "mm",
  "mn",
  "mo",
  "mx",
  "my",
  "mz",
  "ng",
  "ni",
  "no",
  "np",
  "om",
  "pa",
  "pe",
  "ph",
  "pk",
  "pl",
  "pr",
  "ps",
  "pt",
  "py",
  "qa",
  "ro",
  "ru",
  "rw",
  "ad",
  "sa",
  "sd",
  "se",
  "sg",
  "si",
  "sk",
  "sm",
  "sn",
  "so",
  "sv",
  "sy",
  "th",
  "tj",
  "tm",
  "tn",
  "tr",
  "tt",
  "tz",
  "ua",
  "ug",
  "us",
  "uy",
  "ve",
  "ye",
  "za"
];
