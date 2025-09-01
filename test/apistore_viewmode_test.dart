import 'package:arq_app/app/interfaces/client_http_interface.dart';
import 'package:arq_app/app/interfaces/store_repository_interface.dart';
import 'package:arq_app/app/models/store_model.dart';
import 'package:arq_app/app/repository/store_implementation_repository.dart';
import 'package:arq_app/app/viewmodels/apistore_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ClientHttpMockito extends Mock implements ClientHttpInterface {}

class TestAppModule extends Module {
  @override
  void binds(i) {
    i.add<ClientHttpInterface>(ClientHttpMockito.new);
    i.add<StoreRepositoryInterface>(StoreRepositoryImplementation.new);
    i.add(ApistoreViewmodel.new);
  }
}

void main() {
  late ClientHttpMockito mock;
  late ApistoreViewmodel viewModel;

  setUpAll(() {
    Modular.init(TestAppModule());
    mock = ClientHttpMockito();
    viewModel = ApistoreViewmodel(StoreRepositoryImplementation(mock));
  });

  tearDownAll(() {
    Modular.destroy();
  });

  // Caso de teste para um erro na requisição da API
  test('ApiStoreViewModel error', () async {
    // URL corrigida para que a configuração do mock funcione
    final mock = Modular.get<ClientHttpInterface>();
    final viewModel = Modular.get<ApistoreViewmodel>();
    when(
      mock.get("https://fakestoreapi.com/products"),
    ).thenThrow(Exception("Error"));

    await viewModel.fillRepository();
    expect(viewModel.storeviewmodel.value, isNull);
  });

  // Caso de teste para uma requisição de API bem-sucedida
  test('ApiStoreViewModel success', () async {
    final mock = Modular.get<ClientHttpInterface>();
    final viewModel = Modular.get<ApistoreViewmodel>();
    // URL corrigida para que a configuração do mock funcione
    when(mock.get('https://fakestoreapi.com/products')).thenAnswer(
      (_) => Future.value([
        StoreModel(
          id: 123,
          title: 'T-shirt',
          price: 25.99,
          description: 'White T-shirt',
          category: 'Blusa',
        ).toJson(),
      ]),
    );

    await viewModel.fillRepository();
    expect(viewModel.storeviewmodel.value, isA<List<StoreModel>>());
  });
}
