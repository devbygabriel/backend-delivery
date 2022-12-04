class Sales {
  final int id;
  final int customerId;
  final double total;
  final String qrCodeImage;
  final String copiaECola;
  final String due;
  final String status;

  Sales({
    required this.id,
    required this.customerId,
    required this.total,
    required this.qrCodeImage,
    required this.copiaECola,
    required this.due,
    required this.status,
  });
}
