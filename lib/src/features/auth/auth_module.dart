import 'package:backend/src/features/auth/datasource/auth_datasource_impl.dart';
import 'package:backend/src/features/auth/repositories/auth_repository.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'resources/auth_resource.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => AuthRepository(i(), i(), i())),
        Bind.singleton<AuthDataSource>((i) => AuthDataSourceImpl(i())),
      ];

  @override
  // Define as rotas de dentro das funções do Auth
  List<ModularRoute> get routes => [
        Route.resource(AuthResource()),
      ];
}
