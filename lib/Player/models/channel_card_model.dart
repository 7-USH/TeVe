// ignore_for_file: non_constant_identifier_names

class ChannelCardModel {
  String image_url;
  String channel_name;
  String channel_category;
  String languages;
  String code;

  ChannelCardModel(
      {required this.channel_category,
      required this.channel_name,
      required this.code,
      required this.image_url,
      required this.languages});
      
}
