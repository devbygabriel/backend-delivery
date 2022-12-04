import 'dart:async';

import 'package:backend/src/features/cart/models/CartModel.dart';

abstract class CartDataSource {
  Future<Map> getAllCartDataSource(id);
  Future<Map> createCartDataSource(int quantity, int item, int customerId);
  Future<dynamic> updateCartDataSource(int id, int quantity);
  Future<dynamic> deleteCartDataSource(id);
}

class CartRepository {
  final CartDataSource datasource;

  CartRepository(this.datasource);

  FutureOr<dynamic> getAllCart(id) async {
    final cartMap = await datasource.getAllCartDataSource(id);
    return cartMap;
  }

  Future<CartModel> createCart(int quantity, int item, int customerId) async {
    final cartMap =
        await datasource.createCartDataSource(quantity, item, customerId);
    return _getCart(cartMap);
  }

  FutureOr<dynamic> updateCart(int id, int quantity) async {
    final result = await datasource.updateCartDataSource(id, quantity);
    return result;
  }

  FutureOr<dynamic> deleteCart(id) async {
    final result = await datasource.deleteCartDataSource(id);
    return result;
  }

  CartModel _getCart(Map cartMap) {
    return CartModel(
      id: cartMap[0]['id'],
    );
  }
}
