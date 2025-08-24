import 'package:arq_app/app/models/store_model.dart';

abstract class StoreRepositoryInterface {
  Future<StoreModel> getStore();
}
