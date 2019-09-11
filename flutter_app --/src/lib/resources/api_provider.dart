import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import '../model/item_model.dart';



class ApiProvider {
Client client = Client();
Future<ItemResponseModel> fetchToken (String url, {Map body})
async{

  final response =await client.post(url,body: body);
  final int statusCode = response.statusCode;
  if( statusCode <200 || statusCode>400 || json == null)
    {
      throw new Exception("error while fetching data");
    }
  return ItemResponseModel.fromJson(json.decode(response.body));
}

}