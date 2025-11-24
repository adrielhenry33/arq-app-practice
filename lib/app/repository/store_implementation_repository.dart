import 'package:arq_app/app/interfaces/client_http_interface.dart';
import 'package:arq_app/app/interfaces/store_repository_interface.dart';
import 'package:arq_app/app/models/product_model.dart';


class StoreRepositoryImplementation implements StoreRepositoryInterface {
  //injeção de dependencia manual
  final ClientHttpInterface _client;

  StoreRepositoryImplementation(this._client);

  @override
  Future<List<ProductModel>> getStore({String categoria = ''}) async {
    String url = 'https://dummyjson.com/products';

    if (categoria.isNotEmpty) {
      url = 'https://dummyjson.com/products/category/$categoria';
    }

    final jsonList = await _client.get(url);
    return jsonList;
  }
}
