import 'package:backend/src/features/sales/datasource/sales_datasource_impl.dart';
import 'package:backend/src/features/sales/repositories/sales_repository.dart';
import 'package:backend/src/features/sales/resources/sales_resource.dart';
import 'package:shelf_modular/shelf_modular.dart';

class SalesModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => SalesRepository(i())),
        Bind.singleton<SalesDataSource>((i) => SalesDataSourceImpl(i())),
      ];

  @override
  // Define as rotas de dentro das funções do Sales
  List<ModularRoute> get routes => [
        Route.resource(SalesResource()),
      ];
}
