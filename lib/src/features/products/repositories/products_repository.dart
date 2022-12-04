import 'dart:async';
import 'package:backend/src/features/products/models/ProductsModel.dart';

abstract class ProductsDataSource {
  Future<Map> getAllProductsDataSource();
  Future<Map> getProductsByIdDataSource(id);
  Future<Map> createProductsDataSource(params);
  Future<Map> updateProductsDataSource(params);
  Future<dynamic> deleteProductsDataSource(id);
  Future<Map> getAllProductsByDescriptionDataSource(filter);
}

class ProductsRepository {
  final ProductsDataSource datasource;

  ProductsRepository(this.datasource);

  FutureOr<dynamic> getAllProducts() async {
    final productsMap = await datasource.getAllProductsDataSource();
    return productsMap;
  }

  Future<ProductsModel> getProductsById(id) async {
    final productsMap = await datasource.getProductsByIdDataSource(id);
    return _getProducts(productsMap);
  }

  Future<ProductsModel> createProducts(params) async {
    final productsMap = await datasource.createProductsDataSource(params);
    return _getProducts(productsMap);
  }

  Future<ProductsModel> updateProducts(params) async {
    final productsMap = await datasource.updateProductsDataSource(params);
    return _getProducts(productsMap);
  }

  FutureOr<dynamic> getAllProductsByDescription(filter) async {
    final productsMap =
        await datasource.getAllProductsByDescriptionDataSource(filter);
    return productsMap;
  }

  FutureOr<dynamic> deleteProducts(id) async {
    final result = await datasource.deleteProductsDataSource(id);
    return result;
  }

  ProductsModel _getProducts(Map productsMap) {
    return ProductsModel(
      id: productsMap[0]['id'],
      title: productsMap[0]['title'],
      description: productsMap[0]['description'],
      price: productsMap[0]['price'],
      unit: productsMap[0]['unit'],
      picture: productsMap[0]['picture'],
    );
  }
}
