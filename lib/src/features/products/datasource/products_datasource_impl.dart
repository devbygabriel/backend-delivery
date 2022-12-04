import '../../../core/services/database/remote_database.dart';
import '../repositories/products_repository.dart';

class ProductsDataSourceImpl implements ProductsDataSource {
  final RemoteDatabase database;

  ProductsDataSourceImpl(this.database);

  @override
  Future<Map> createProductsDataSource(params) async {
    final result = await database.query(
      'INSERT INTO products (title, description, price, unit, picture) VALUES (@title, @description, @price, @unit, @picture) RETURNING id, title, description, price, unit, picture',
      variables: params,
    );
    final listProducts = result.map((e) => e['products']).toList();
    return listProducts.asMap();
  }

  @override
  Future<dynamic> deleteProductsDataSource(id) async {
    await database
        .query('DELETE FROM products WHERE id = @id', variables: {'id': id});

    Map<String, dynamic> result = {'message': 'deleted product $id'};

    return result;
  }

  @override
  Future<Map> getAllProductsDataSource() async {
    final result = await database.query(
      "SELECT id, title, description, price, unit, picture FROM products",
    );

    final listProductss = result.map((e) => e['products']).toList();

    Map<String, dynamic> results = {'result': listProductss};

    return results;
  }

  @override
  Future<Map> getProductsByIdDataSource(id) async {
    final result = await database.query(
        "SELECT id, title, description, price, unit, picture FROM products WHERE id=@id",
        variables: {'id': id});
    final listProducts = result.map((e) => e['products']).toList();
    return listProducts.asMap();
  }

  @override
  Future<Map> updateProductsDataSource(params) async {
    final columns = params.keys
        .where((key) => key != 'id')
        .map((key) => '$key=@$key')
        .toList();

    final result = await database.query(
      'UPDATE products SET ${columns.join(',')} WHERE id = @id RETURNING id, title, description, price, unit, picture',
      variables: params,
    );

    final listProducts = result.map((e) => e['products']).toList();
    return listProducts.asMap();
  }

  @override
  Future<Map> getAllProductsByDescriptionDataSource(filter) async {
    final result = await database.query(
      "SELECT id, title, description, price, unit, picture FROM products WHERE title like '%$filter%'",
    );

    final listProductss = result.map((e) => e['products']).toList();
    Map<String, dynamic> results = {'result': listProductss};
    return results;
  }
}
