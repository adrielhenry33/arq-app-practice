import 'package:arq_app/app/Repository/store_implementation_repository.dart';
import 'package:arq_app/app/Services/client_http_service.dart';
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

void main() {
  //teste para pegar o erro ou seja quando da errado
  test('ApiStoreViewModel error', () async {
    final viewModel = ApistoreViewmodel(
      StoreRepositoryImplementation(ClientHttpServiceImplementation()),
    );

    await viewModel.fillRepository();
    expect(viewModel.storeviewmodel.value, null);
  });

  test('ApiStoreViewModel success', () async {
    final viewModel = ApistoreViewmodel(
      StoreRepositoryImplementation(ClientHttpMock()),
    );

    await viewModel.fillRepository();
    expect(viewModel.storeviewmodel.value, isA<StoreModel>());
    expect(actual, matcher)
  });

} 
  

