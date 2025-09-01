import 'package:arq_app/app/interfaces/client_http_interface.dart';
import 'package:arq_app/app/interfaces/store_repository_interface.dart';
import 'package:arq_app/app/models/store_model.dart';

class StoreRepositoryImplementation  implements StoreRepositoryInterface {
  
  //injeção de dependencia manual 
  final ClientHttpInterface  client;

  StoreRepositoryImplementation(this.client);

  @override
  Future<StoreModel> getStore() async {
    var json = await client.get('https://fakestoreapi.com/products');
    StoreModel model = StoreModel.fromJson(json[0]); 
    return model;
  }

}