import 'package:backend/src/features/erp_users/datasource/erp_users_datasource_impl.dart';
import 'package:backend/src/features/erp_users/repositories/erp_users_repository.dart';
import 'package:backend/src/features/erp_users/resources/erp_users_resource.dart';
import 'package:shelf_modular/shelf_modular.dart';

class ErpUsersModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => ErpUsersRepository(i(), i())),
        Bind.singleton<ErpUsersDataSource>((i) => ErpUsersDataSourceImpl(i())),
      ];

  @override
  // Define as rotas de dentro das funções do ErpUsers
  List<ModularRoute> get routes => [
        Route.resource(ErpUsersResource()),
      ];
}
