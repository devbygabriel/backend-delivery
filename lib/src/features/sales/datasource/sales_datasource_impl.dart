import '../../../core/services/database/remote_database.dart';
import '../repositories/sales_repository.dart';

class SalesDataSourceImpl implements SalesDataSource {
  final RemoteDatabase database;

  SalesDataSourceImpl(this.database);

  @override
  Future<Map> createSalesDataSource(int customerId, double total) async {
    final String qrCodeImage =
        "00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0";
    final String due = '2022-12-31 10:00:10.458';

    final result = await database.query(
        'INSERT INTO sales (customer_id, total, qr_code_image, copia_e_cola, due) VALUES (@customer_id, @total, @qr_code_image, @copia_e_cola, @due) RETURNING id, total, qr_code_image, copia_e_cola, due, status',
        variables: {
          'customer_id': customerId,
          'total': total,
          'qr_code_image': qrCodeImage,
          'copia_e_cola': qrCodeImage,
          'due': due,
        });

    await database.query(
        'INSERT INTO products_sales (sales_id, quantity, item, title, description, price, unit, picture) (SELECT (SELECT MAX(id) AS id FROM sales WHERE customer_id = $customerId), quantity, item, title, description, price, unit, picture FROM cart WHERE customer_id = $customerId)');

    await database.query('DELETE FROM cart WHERE customer_id = $customerId');

    final listSales = result.map((e) => e['sales']).toList();

    return listSales.asMap();
  }

  @override
  Future<dynamic> deleteSalesDataSource(id) async {
    await database
        .query('DELETE FROM sales WHERE id = @id', variables: {'id': id});

    Map<String, dynamic> result = {'message': 'deleted sale $id'};

    return result;
  }

  @override
  Future<dynamic> getAllSalesDataSource() async {
    final result = await database.query(
        "SELECT id, total, qr_code_image, copia_e_cola, due, status FROM sales order by id desc");
    final listSales = result.map((e) => e['sales']).toList();

    Map<String, dynamic> sales = {'result': listSales};

    return sales;
  }

  @override
  Future<dynamic> getSalesByIdDataSource(customerId) async {
    final result = await database.query(
        "SELECT id, total, qr_code_image, copia_e_cola, due, status FROM sales WHERE customer_id=@customer_id order by id desc",
        variables: {'customer_id': customerId});
    final listSales = result.map((e) => e['sales']).toList();

    Map<String, dynamic> sales = {'result': listSales};

    return sales;
  }

  @override
  Future<Map> getProductsSalesBySalesIdDataSource(salesId) async {
    final result = await database.query(
        "SELECT id, quantity, item, title, description, price, unit, picture FROM products_sales WHERE sales_id=@sales_id",
        variables: {'sales_id': salesId});

    final listProducts = result.map((e) => e['products_sales']).toList();

    Map<String, dynamic> results = {
      'result': listProducts,
    };

    return results;
  }

  @override
  Future<Map> updateSalesDataSource(params) async {
    final columns = params.keys
        .where((key) => key != 'id')
        .map((key) => '$key=@$key')
        .toList();

    final result = await database.query(
      'UPDATE sales SET ${columns.join(',')} WHERE id = @id RETURNING id, customer_id, status',
      variables: params,
    );
    final listSales = result.map((e) => e['sales']).toList();
    return listSales.asMap();
  }
}
