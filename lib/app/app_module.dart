import 'package:arq_app/app/Repository/favorites_repository.dart';
import 'package:arq_app/app/Repository/product_category_repository.dart';
import 'package:arq_app/app/Repository/store_implementation_repository.dart';
import 'package:arq_app/app/Services/shared_local_storage_service.dart';
import 'package:arq_app/app/components/card_carrinho_component.dart';
import 'package:arq_app/app/interfaces/client_http_interface.dart';
import 'package:arq_app/app/interfaces/local_storage_interface.dart';
import 'package:arq_app/app/interfaces/product_category_interface.dart';
import 'package:arq_app/app/interfaces/store_repository_interface.dart';
import 'package:arq_app/app/models/cart_product_model.dart';
import 'package:arq_app/app/models/product_model.dart';
import 'package:arq_app/app/services/client_http_service.dart';
import 'package:arq_app/app/view/carrinho_view.dart';
import 'package:arq_app/app/view/details_view.dart';
import 'package:arq_app/app/view/home_view.dart';
import 'package:arq_app/app/view/products_list_view.dart';
import 'package:arq_app/app/view/recover_view.dart';
import 'package:arq_app/app/viewmodels/app_controller.dart';
import 'package:arq_app/app/viewmodels/change_theme_viewmodel.dart';
import 'package:arq_app/app/viewmodels/home_viewmodel.dart';
import 'package:arq_app/app/viewmodels/login_viewmodel.dart';
import 'package:arq_app/app/viewmodels/recover_viewmodel.dart';
import 'package:arq_app/app/viewmodels/registrarion_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add<ClientHttpInterface>(ClientHttpServiceImplementation.new);

    i.addLazySingleton<LocalStorageInterface>(
      SharedLocalStorageServiceImplementation.new,
    );

    i.addSingleton(FavoritasRepository.new);
    i.addLazySingleton<StoreRepositoryInterface>(
      () => StoreRepositoryImplementation(i.get<ClientHttpInterface>()),
    );
    i.addLazySingleton(AppController.new);
    i.addSingleton<IProductCategoryInterface>(
      () => ProductCategoryRepository(i.get<ClientHttpInterface>()),
    );

    i.add<RecoverViewmodel>(RecoverViewmodel.new);
    i.add<LoginViewmodel>(LoginViewmodel.new);
    i.addLazySingleton(ChangeThemeViewmodel.new);
    i.add<RegistrarionViewmodel>(RegistrarionViewmodel.new);

    i.addLazySingleton<HomeViewModel>(
      () => HomeViewModel(
        i.get<FavoritasRepository>(),
        i.get<StoreRepositoryInterface>(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) {
        return HomeView();
      },
    );
    r.child('/register', child: (context) => RecoverView());
    r.child('/recover', child: (context) => RecoverView());
    r.child(
      '/produtos',
      child: (context) {
        final args = r.args.data as Map<String, dynamic>;
        return ProductsListView(
          nomeCategoria: args['categoria'],
          titulo: args['titulo'],
        );
      },
    );
    r.child(
      '/details',
      child: (context) {
        final args = r.args.data as ProductModel;
        return DetailsView(produto: args);
      },
    );
    r.child(
      '/carrinho',
      child: (context) {
        return CartView();
      },
    );
  }
}
