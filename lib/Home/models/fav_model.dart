class FavModel {
  String? streamLink;
  String? category;
  String? channelName;

  FavModel({this.streamLink, this.category, this.channelName});

  FavModel.fromJson(Map<String, dynamic> json) {
    streamLink = json['stream_link'];
    category = json['category'];
    channelName = json['channel_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stream_link'] = streamLink;
    data['category'] = category;
    data['channel_name'] = channelName;
    return data;
  }
}
