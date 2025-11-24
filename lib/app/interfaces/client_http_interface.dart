import 'package:arq_app/app/models/product_model.dart';

abstract  class ClientHttpInterface {
  void addHeader(String header );
  Future<List<ProductModel>> get(String url) ;

}