import 'package:arq_app/app/interfaces/client_http_interface.dart';
import 'package:arq_app/app/interfaces/store_repository_interface.dart';
import 'package:arq_app/app/models/product_model.dart';
import 'package:arq_app/app/repository/store_implementation_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ClientHttpMockito extends Mock implements ClientHttpInterface {}

class TestAppModule extends Module {
  @override
  void binds(i) {
    i.add<ClientHttpInterface>(ClientHttpMockito.new);
    i.add<StoreRepositoryInterface>(StoreRepositoryImplementation.new);
  }
}

void main() {
  late ClientHttpMockito mock;

  setUpAll(() {
    Modular.init(TestAppModule());
    mock = ClientHttpMockito();
  });

  tearDownAll(() {
    Modular.destroy();
  });

  // Caso de teste para um erro na requisição da API
  test('ApiStoreViewModel error', () async {
    // URL corrigida para que a configuração do mock funcione
    final mock = Modular.get<ClientHttpInterface>();
    when(
      mock.get("https://fakestoreapi.com/products"),
    ).thenThrow(Exception("Error"));

    
  });

  // Caso de teste para uma requisição de API bem-sucedida
  test('ApiStoreViewModel success', () async {
    final mock = Modular.get<ClientHttpInterface>();
    // URL corrigida para que a configuração do mock funcione
    when(mock.get('https://fakestoreapi.com/products')).thenAnswer(
      (_) => Future.value([])
    );

  
  });
}

