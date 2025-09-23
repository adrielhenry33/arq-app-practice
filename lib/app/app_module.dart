import 'package:arq_app/app/Repository/favorites_repository.dart';
import 'package:arq_app/app/Repository/store_implementation_repository.dart';
import 'package:arq_app/app/Services/shared_local_storage_service.dart';
import 'package:arq_app/app/controllers/app_controller.dart';
import 'package:arq_app/app/controllers/favorites_controller.dart';
import 'package:arq_app/app/controllers/home_controller.dart';
import 'package:arq_app/app/interfaces/client_http_interface.dart';
import 'package:arq_app/app/interfaces/local_storage_interface.dart';
import 'package:arq_app/app/interfaces/store_repository_interface.dart';
import 'package:arq_app/app/pages/home/home_page.dart';
import 'package:arq_app/app/pages/login/login_page.dart';
import 'package:arq_app/app/pages/favorites/favorites_page.dart';
import 'package:arq_app/app/pages/registration/registration_page.dart';
import 'package:arq_app/app/services/client_http_service.dart';
import 'package:arq_app/app/viewmodels/apistore_viewmodel.dart';
import 'package:arq_app/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(FavoritasRepository.new);

    i.addSingleton(HomeController.new);
    i.addSingleton(FavoritesController.new);
    i.add(ApistoreViewmodel.new);
    i.add<StoreRepositoryInterface>(StoreRepositoryImplementation.new);
    i.add<ClientHttpInterface>(ClientHttpServiceImplementation.new);
    i.addLazySingleton(AppController.new);
    i.add(ChangeThemeViewmodel.new);
    i.add<LocalStorageInterface>(SharedLocalStorageServiceImplementation.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => LoginPage());
    r.child('/home', child: (context) => HomePage());
    r.child('/register', child: (context) => RegistrationPage());
    r.child('/favorites', child: (context) => FavoritesPage());
  }
}
