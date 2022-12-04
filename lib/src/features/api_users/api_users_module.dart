import 'package:backend/src/features/api_users/datasource/api_users_datasource_impl.dart';
import 'package:backend/src/features/api_users/repositories/api_users_repository.dart';
import 'package:backend/src/features/api_users/resources/api_users_resource.dart';
import 'package:shelf_modular/shelf_modular.dart';

class ApiUserModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => ApiUserRepository(i(), i())),
        Bind.singleton<ApiUserDataSource>((i) => ApiUserDataSourceImpl(i())),
      ];

  @override
  // Define as rotas de dentro das funções do Api Users
  List<ModularRoute> get routes => [
        Route.resource(ApiUserResource()),
      ];
}
