import 'package:arq_app/app/Services/shared_local_storage_service.dart';
import 'package:arq_app/app/interfaces/client_http_interface.dart';
import 'package:arq_app/app/interfaces/local_storage_interface.dart';
import 'package:arq_app/app/interfaces/store_repository_interface.dart';
import 'package:arq_app/app/repository/store_implementation_repository.dart';
import 'package:arq_app/app/services/client_http_service.dart';
import 'package:arq_app/app/viewmodels/apistore_viewmodel.dart';
import 'package:arq_app/app/viewmodels/change_theme_viewmodel.dart';
import 'package:arq_app/controllers/app_controller.dart';
import 'package:arq_app/controllers/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(HomeController.new);
    i.add(ApistoreViewmodel.new);
    i.add<StoreRepositoryInterface>(StoreRepositoryImplementation.new);
    i.add<ClientHttpInterface>(ClientHttpServiceImplementation.new);
    i.addLazySingleton(AppController.new);
    i.add(ChangeThemeViewmodel.new);
    i.add<LocalStorageInterface>(SharedLocalStorageServiceImplementation.new);
  }
}
