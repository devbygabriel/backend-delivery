import 'package:backend/src/features/products/datasource/products_datasource_impl.dart';
import 'package:backend/src/features/products/repositories/products_repository.dart';
import 'package:backend/src/features/products/resources/products_resource.dart';
import 'package:shelf_modular/shelf_modular.dart';

class ProductsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => ProductsRepository(i())),
        Bind.singleton<ProductsDataSource>((i) => ProductsDataSourceImpl(i())),
      ];

  @override
  // Define as rotas de dentro das funções do Products
  List<ModularRoute> get routes => [
        Route.resource(ProductsResource()),
      ];
}
