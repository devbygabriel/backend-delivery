import 'package:backend/src/features/customers/datasource/customers_datasource_impl.dart';
import 'package:backend/src/features/customers/repositories/customers_repository.dart';
import 'package:backend/src/features/customers/resources/customers_resource.dart';
import 'package:shelf_modular/shelf_modular.dart';

class CustomersModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => CustomerRepository(i(), i())),
        Bind.singleton<CustomersDataSource>(
            (i) => CustomersDataSourceImpl(i())),
      ];

  @override
  // Define as rotas de dentro das funções do Customers
  List<ModularRoute> get routes => [
        Route.resource(CustomersResource()),
      ];
}
