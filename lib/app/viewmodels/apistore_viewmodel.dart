import 'package:arq_app/app/interfaces/store_repository_interface.dart';
import 'package:arq_app/app/models/store_model.dart';
import 'package:flutter/foundation.dart';

/*Explicando ValueNotifier<StoreModel>()
A linha final storeviewmodel = ValueNotifier<StoreModel>(); 
faz duas coisas importantes:
Cria uma variável chamada storeviewmodel.
Cria uma instância de ValueNotifier.
O ponto chave aqui é o <StoreModel>. Isso é o que chamamos de tipagem genérica.
ValueNotifier é uma classe genérica, ou seja, ela pode gerenciar qualquer tipo de dado.
Ao escrever ValueNotifier<StoreModel>, você está especificando que esta instância de ValueNotifier é responsável por gerenciar um objeto do tipo StoreModel. O compilador do Dart agora sabe
 que o valor contido nesse ValueNotifier será sempre um StoreModel.
Isso é ótimo porque o Dart vai garantir a segurança de tipos para
 você. Por exemplo, você não conseguirá acidentalmente atribuir um 
 int ou uma String ao valor do seu ValueNotifier. */
class ApistoreViewmodel {
  final StoreRepositoryInterface repositoryInterface;

  final storeviewmodel = ValueNotifier<List<StoreModel?>>(
    []
  );

  ApistoreViewmodel(this.repositoryInterface);

  Future<void>fillRepository() async {
    try {
      storeviewmodel.value = await repositoryInterface.getStore();
    } catch (e) {
      storeviewmodel.value = [];
    }
  }
}
