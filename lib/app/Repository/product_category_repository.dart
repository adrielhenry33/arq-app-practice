import 'package:arq_app/app/interfaces/client_http_interface.dart';
import 'package:arq_app/app/interfaces/product_category_interface.dart';
import 'package:arq_app/app/models/product_model.dart';

class ProductCategoryRepository implements IProductCategoryInterface {
  final ClientHttpInterface _clientHttpService;

  ProductCategoryRepository(this._clientHttpService);

  @override
  Future<List<ProductModel>> getCategory(String categoria) async {
    if (categoria == 'eletronicos') return fetchEletronicos();

    final response = await _clientHttpService.get(
      'https://dummyjson.com/products/category/$categoria',
    );
    return response;
  }

  Future<List<ProductModel>> fetchEletronicos() async {
    try {
      final response = await Future.wait([
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

      final listaEletronicos = <ProductModel>[
        ...response[0],
        ...response[1],
        ...response[2],
        ...response[3],
      ];
      return listaEletronicos;
    } catch (e) {
      return [];
    }
  }
}
