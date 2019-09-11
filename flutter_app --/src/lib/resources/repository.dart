
import '../model/item_model.dart';
import 'api_provider.dart';


class Repository
{
  final networkingProvider = ApiProvider();

  Future<ItemResponseModel> getToken (String url, {Map body})
  {
    return networkingProvider.fetchToken(url,body: body);
  }
}