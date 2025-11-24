import 'package:arq_app/app/models/product_model.dart';

abstract class StoreRepositoryInterface {
  Future<List<ProductModel>> getStore({String categoria = ''});
}
