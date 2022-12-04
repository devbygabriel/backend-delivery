import 'dart:async';
import 'package:backend/src/features/sales/models/SalesModel.dart';

abstract class SalesDataSource {
  Future<dynamic> getAllSalesDataSource();
  Future<dynamic> getSalesByIdDataSource(customerId);
  Future<dynamic> getProductsSalesBySalesIdDataSource(salesId);
  Future<Map> createSalesDataSource(int customerId, double total);
  Future<Map> updateSalesDataSource(params);
  Future<dynamic> deleteSalesDataSource(id);
}

class SalesRepository {
  final SalesDataSource datasource;

  SalesRepository(this.datasource);

  FutureOr<dynamic> getAllSales() async {
    final salesMap = await datasource.getAllSalesDataSource();
    return salesMap;
  }

  Future<dynamic> getSalesById(customerId) async {
    final salesMap = await datasource.getSalesByIdDataSource(customerId);
    return salesMap;
  }

  Future<dynamic> getProductsSalesBySalesId(salesId) async {
    final productsSalesMap =
        await datasource.getProductsSalesBySalesIdDataSource(salesId);
    return productsSalesMap;
  }

  Future<SalesModel> createSales(int customerId, double total) async {
    final salesMap = await datasource.createSalesDataSource(customerId, total);
    return _getSales(salesMap);
  }

  Future<dynamic> updateSales(params) async {
    final salesMap = await datasource.updateSalesDataSource(params);
    return salesMap;
  }

  FutureOr<dynamic> deleteSales(id) async {
    final result = await datasource.deleteSalesDataSource(id);
    return result;
  }

  SalesModel _getSales(Map salesMap) {
    return SalesModel(
      id: salesMap[0]['id']?.toInt() ?? 0,
      total: double.parse(salesMap[0]['total']),
      qrCodeImage: salesMap[0]['qr_code_image'],
      copiaECola: salesMap[0]['copia_e_cola'],
      due: salesMap[0]['due'],
      status: salesMap[0]['status'],
    );
  }
}
