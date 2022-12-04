import 'package:backend/src/features/cart/datasource/cart_datasource_impl.dart';
import 'package:backend/src/features/cart/repositories/cart_repository.dart';
import 'package:backend/src/features/cart/resources/cart_resource.dart';
import 'package:shelf_modular/shelf_modular.dart';

class CartModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => CartRepository(i())),
        Bind.singleton<CartDataSource>((i) => CartDataSourceImpl(i())),
      ];

  @override
  // Define as rotas de dentro das funções do Cart
  List<ModularRoute> get routes => [
        Route.resource(CartResource()),
      ];
}
