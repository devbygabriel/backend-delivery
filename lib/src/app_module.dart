import 'package:backend/src/core/core_module.dart';
import 'package:backend/src/features/api_users/api_users_module.dart';
import 'package:backend/src/features/auth/auth_module.dart';
import 'package:backend/src/features/cart/cart_module.dart';
import 'package:backend/src/features/customers/customers_module.dart';
import 'package:backend/src/features/erp_users/erp_users_module.dart';
import 'package:backend/src/features/products/products_module.dart';
import 'package:backend/src/features/sales/sales_module.dart';
import 'package:backend/src/features/swagger/swagger_handler.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class AppModule extends Module {
  @override
  // Importa a lista de modulos do CoreModule
  List<Module> get imports => [CoreModule()];

  @override
  List<ModularRoute> get routes => [
        Route.get('/', (Request request) => Response.ok('Home Page')),
        Route.get('/docs/**', swaggerHandler),
        Route.module('/', module: ApiUserModule()),
        Route.module('/', module: CustomersModule()),
        Route.module('/', module: ErpUsersModule()),
        Route.module('/', module: CartModule()),
        Route.module('/', module: ProductsModule()),
        Route.module('/', module: SalesModule()),
        Route.module('/auth', module: AuthModule()),
      ];
}
