class SessionModel {
  String? accessToken;
  String? tokenType;

  SessionModel({this.accessToken, this.tokenType});

  SessionModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    return data;
  }
}
