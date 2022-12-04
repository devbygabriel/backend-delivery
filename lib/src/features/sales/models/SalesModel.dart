import 'dart:convert';

class SalesModel {
  final int id;
  final double total;
  final String qrCodeImage;
  final String copiaECola;
  final String due;
  final String status;

  SalesModel({
    required this.id,
    required this.total,
    required this.qrCodeImage,
    required this.copiaECola,
    required this.due,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'total': total,
      'qr_code_image': qrCodeImage,
      'copia_e_cola': copiaECola,
      'due': due,
      'status': status,
    };
  }

  factory SalesModel.fromMap(Map<String, dynamic> map) {
    return SalesModel(
      id: map['id']?.toInt() ?? 0,
      total: map['total']?.toDouble() ?? 0.0,
      qrCodeImage: map['qr_code_image'] ?? '',
      copiaECola: map['copia_e_cola'] ?? '',
      due: map['due'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SalesModel.fromJson(String source) =>
      SalesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SalesModel(id: $id, total: $total, qrCodeImage: $qrCodeImage, copiaECola: $copiaECola, due: $due, status: $status)';
  }
}
