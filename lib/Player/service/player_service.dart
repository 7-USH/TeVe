// ignore_for_file: use_build_context_synchronously, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:teve/Home/models/channel_model.dart';
import 'package:teve/common/api.dart';

class PlayerService {
  ApiService _service = ApiService();

  Future<String> addToFav(
      {required BuildContext context, required ChannelModel model}) async {
    String endpoint = "fav/add";
    var response =
        await _service.postHeaderData(endpoint, model.toJson(), isDb: true);
    if (response.isLeft) {
      return "This Channel is already in your favorite's.";
    } else {
      return "Added to favorite's";
    }
  }
}
