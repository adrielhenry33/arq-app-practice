//toda a regra de negócio ja componentizada
/*O que é a camada ViewModel?
O ViewModel é a camada responsável por gerenciar o estado da interface do
 usuário e a lógica de apresentação. A principal função dele é fornecer 
os dados formatados e prontos para a View, 
além de processar as ações do usuário e atualizar o estado da aplicação. */
import 'package:arq_app/app/interfaces/local_storage_interface.dart';
import 'package:arq_app/app/models/app_config_model.dart';

// a melhor forma de usar o localStorage seria por injeção de dependência via
//construtor justamente para facilitar o acesso e melhorar o acoplamento

class ChangeThemeViewmodel {
  final LocalStorageInterface storage;
  final AppConfigModel config = AppConfigModel();

  ChangeThemeViewmodel({required this.storage});


  Future initStorage() async {
   await storage.get('isDark').then((value){ 
      if (value != null) {
        
        config.themeSwicht.value = value;
      }
    });
  }

  void changeTheme(bool value) {
    config.themeSwicht.value = value;
    storage.put('isDark', value);
    
  }
}
 