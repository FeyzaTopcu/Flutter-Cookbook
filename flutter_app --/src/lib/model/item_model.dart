class ItemRequestModel {
  final String grant_type;
  final String username;
  final String password;

  ItemRequestModel({this.grant_type, this.username, this.password });

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["grant_type"] = grant_type;
    map["_username"] = username;
    map["password"] = password;
    return map;

  }
}

class ItemResponseModel {
  final String access_token;
  final String token_type;
  final int expires_in;

  ItemResponseModel({this.access_token, this.token_type, this.expires_in});

  factory ItemResponseModel.fromJson(Map<String, dynamic> json){

    return ItemResponseModel(

      access_token: json['access_token'],
      token_type: json['token_type'],
      expires_in: json['token_type'],


    );
  }




}

