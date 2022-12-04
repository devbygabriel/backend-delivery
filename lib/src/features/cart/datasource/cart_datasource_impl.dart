import '../../../core/services/database/remote_database.dart';
import '../repositories/cart_repository.dart';

class CartDataSourceImpl implements CartDataSource {
  final RemoteDatabase database;

  CartDataSourceImpl(this.database);

  @override
  Future<Map> createCartDataSource(
      int quantity, int item, int customerId) async {
    final result = await database.query(
      'INSERT INTO cart (quantity, item, title, description, price, unit, picture, customer_id) (SELECT $quantity, $item, title, description, price, unit, picture, $customerId FROM products WHERE id = $item) RETURNING id',
    );
    final listCarts = result.map((e) => e['cart']).toList();
    return listCarts.asMap();
  }

  @override
  Future<dynamic> deleteCartDataSource(id) async {
    await database
        .query('DELETE FROM cart WHERE id = @id', variables: {'id': id});

    Map<String, dynamic> result = {'message': 'deleted cart $id'};

    return result;
  }

  @override
  Future<Map> getAllCartDataSource(id) async {
    final result = await database.query(
        "SELECT id, quantity, item, title, description, price, unit, picture FROM cart WHERE customer_id=@customer_id",
        variables: {'customer_id': id});

    final listCarts = result.map((e) => e['cart']).toList();

    Map<String, dynamic> results = {
      'result': listCarts,
    };

    return results;
  }

  @override
  Future<dynamic> updateCartDataSource(int id, int quantity) async {
    if (quantity == 0) {
      await database.query(
        'DELETE FROM cart WHERE id = @id',
        variables: {
          'id': id,
        },
      );
    } else {
      await database.query(
        'UPDATE cart SET quantity = @quantity WHERE id = @id',
        variables: {
          'id': id,
          'quantity': quantity,
        },
      );
    }

    Map<String, dynamic> result = {'message': 'update success'};

    return result;
  }
}
