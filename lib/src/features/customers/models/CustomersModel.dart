import 'dart:convert';

class CustomersModel {
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

  CustomersModel({
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'telephone': telephone,
      'cpf': cpf,
      'zip_code': zipCode,
      'public_place': publicPlace,
      'number': number,
      'complement': complement,
      'city': city,
      'district': district,
    };
  }

  factory CustomersModel.fromMap(Map<String, dynamic> map) {
    return CustomersModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      telephone: map['telephone'] ?? '',
      cpf: map['cpf'] ?? '',
      zipCode: map['zip_code'] ?? '',
      publicPlace: map['public_place'] ?? '',
      number: map['number'] ?? '',
      complement: map['complement'],
      city: map['city'] ?? '',
      district: map['district'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomersModel.fromJson(String source) =>
      CustomersModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomersModel(id: $id, name: $name, email: $email, telephone: $telephone, cpf: $cpf, zipCode: $zipCode, publicPlace: $publicPlace, number: $number, complement: $complement, city: $city, district: $district)';
  }
}
