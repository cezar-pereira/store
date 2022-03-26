import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/modules/home/domain/usecases/fetch_categories_usecase.dart';
import 'package:store/app/modules/home/infra/repositories/category_repository.dart';
import 'domain/repositories/category_repository_interface.dart';
import 'external/category_datasource_dio.dart';
import 'infra/datasource/category_datasource_interface.dart';
import 'presenter/home_page.dart';
import 'presenter/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    /*** DATASOURCE  ***/
    Bind.lazySingleton((i) => CategoryDatasource()),
    /*** REPOSITORIES  ***/
    Bind.lazySingleton((i) =>
        CategoryRepository(datasource: i.get<CategoryDatasourceInterface>())),
    /*** USECASES  ***/
    Bind.lazySingleton((i) => FetchCategoriesUsecase(
        repository: i.get<CategoryRepositoryInterface>())),
    /*** STORE  ***/
    Bind.lazySingleton((i) =>
        HomeStore(fetchCategoriesUsecase: i.get<FetchCategoriesUsecase>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
