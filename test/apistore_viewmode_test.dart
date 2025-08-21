import 'package:arq_app/app/repository/store_implementation_repository.dart';
import 'package:arq_app/app/interfaces/client_http_interface.dart';
import 'package:arq_app/app/models/store_model.dart';
import 'package:arq_app/app/viewmodels/apistore_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

class ClientHttpMock implements ClientHttpInterface {
  @override
  void addHeader(String token) {}

  @override
  Future<Map<String, dynamic>> get(String url) async {
    return StoreModel(
      id: 123,
      title: 'T-shirt',
      price: 25.99,
      description: 'White T-shirt',
      category: 'Blusa',
    ).toJson();
  }
}

class ClientHttpErrorMock implements ClientHttpInterface {
  @override
  void addHeader(String token) {}

  @override
  Future<Map<String, dynamic>> get(String url) async {
    return StoreModel(
      id: -1,
      title: 'falha na requisição ',
      price: 0.0,
      description: 'falha na requisição',
      category: 'falha na requisição',
    ).toJson();
  }
}

void main() {
  //teste para quando a requisição da api der errado
  group('ApiStoreModel', () {
    test('ApiStoreViewModel error', () async {
      final viewModel = ApistoreViewmodel(
        StoreRepositoryImplementation(ClientHttpErrorMock()),
      );

      await viewModel.fillRepository();
      expect(viewModel.storeviewmodel.value.id, -1);
    });

    test('ApiStoreViewModel success', () async {
      final viewModel = ApistoreViewmodel(
        StoreRepositoryImplementation(ClientHttpMock()),
      );

      await viewModel.fillRepository();
      expect(viewModel.storeviewmodel.value, isA<StoreModel>());
    });
  });
}
