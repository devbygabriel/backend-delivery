class Customers {
  final int id;
  final String name;
  final String email;
  final String telephone;
  final String cpf;
  final String zipCode;
  final String publicPlace;
  final String number;
  final String? complement;
  final String city;
  final String district;

  Customers({
    required this.id,
    required this.name,
    required this.email,
    required this.telephone,
    required this.cpf,
    required this.zipCode,
    required this.publicPlace,
    required this.number,
    this.complement,
    required this.city,
    required this.district,
  });
}
