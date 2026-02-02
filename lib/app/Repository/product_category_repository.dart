import 'package:arq_app/app/interfaces/client_http_interface.dart';
import 'package:arq_app/app/interfaces/product_category_interface.dart';
import 'package:arq_app/app/models/product_model.dart';

class ProductCategoryRepository implements IProductCategoryInterface {
  final ClientHttpInterface _clientHttpService;

  ProductCategoryRepository(this._clientHttpService);

  List<ProductModel> _parseProducts(dynamic responseBody) {
    if (responseBody is Map && responseBody.containsKey('products')) {
      final List list = responseBody['products'];
      return list.map((item) => ProductModel.fromJson(item)).toList();
    }
    return [];
  }

  @override
  Future<List<ProductModel>> getCategory(String categoria) async {
    if (categoria == 'eletronicos') return fetchEletronicos();

    final json = await _clientHttpService.get(
      'https://dummyjson.com/products/category/$categoria',
    );

    return _parseProducts(json);
  }

  Future<List<ProductModel>> fetchEletronicos() async {
    try {
      final responses = await Future.wait([
        _clientHttpService.get(
          'https://dummyjson.com/products/category/smartphones',
        ),
        _clientHttpService.get(
          'https://dummyjson.com/products/category/tablets',
        ),
        _clientHttpService.get(
          'https://dummyjson.com/products/category/laptops',
        ),
        _clientHttpService.get(
          'https://dummyjson.com/products/category/mobile-accessories',
        ),
      ]);

      final listaFinal = <ProductModel>[];

      for (var json in responses) {
        listaFinal.addAll(_parseProducts(json));
      }

      return listaFinal;
    } catch (e) {
      return [];
    }
  }
}
