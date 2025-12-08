import 'package:arq_app/app/models/product_model.dart';

abstract class IProductCategoryInterface {
  Future<List<ProductModel>> getCategory(String urlEspec);
}
