import '../../../../../shared/enums/enums.dart';

class PersonAddressEntity {
  final int? idAddress;
  final String typeAddress;
  final String zipCode;
  final String? streetName;
  final String? number;
  final String? complement;
  final String? district;
  final String? city;
  final String? state;
  final String? country;
  final String? reference;
  final String? latitud;
  final String? longitud;
  final String? obs;

  PersonAddressEntity({
    this.idAddress,
    required this.typeAddress,
    required this.zipCode,
    this.streetName,
    this.number,
    this.complement,
    this.district,
    this.city,
    this.state,
    this.country,
    this.reference,
    this.latitud,
    this.longitud,
    this.obs,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (idAddress != null) {
      result.addAll({'idAddress': idAddress});
    }
    result.addAll({'typeAddress': typeAddress.toString()});
    result.addAll({'zipCode': zipCode});
    if (streetName != null) {
      result.addAll({'streetName': streetName});
    }
    if (number != null) {
      result.addAll({'number': number});
    }
    if (complement != null) {
      result.addAll({'complement': complement});
    }
    if (district != null) {
      result.addAll({'district': district});
    }
    if (city != null) {
      result.addAll({'city': city});
    }
    if (state != null) {
      result.addAll({'state': state});
    }
    if (country != null) {
      result.addAll({'country': country});
    }
    if (reference != null) {
      result.addAll({'reference': reference});
    }
    if (latitud != null) {
      result.addAll({'latitud': latitud});
    }
    if (longitud != null) {
      result.addAll({'longitud': longitud});
    }
    if (obs != null) {
      result.addAll({'obs': obs});
    }

    return result;
  }

  factory PersonAddressEntity.fromMap(Map<String, dynamic> map) {
    EnumTypeAddressEnum typeAddress;

    return PersonAddressEntity(
      idAddress: map['idAddress'] as int?,
      typeAddress: map['typeAddress'] as String,
      zipCode: map['zipCode'] as String,
      streetName: map['streetName'] as String?,
      number: map['number'] as String?,
      complement: map['complement'] as String?,
      district: map['district'] as String?,
      city: map['city'] as String?,
      state: map['state'] as String?,
      country: map['country'] as String?,
      reference: map['reference'] as String?,
      latitud: map['latitud'] as String?,
      longitud: map['longitud'] as String?,
      obs: map['obs'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idAddress': idAddress ?? 0,
      'typeAddress': typeAddress,
      'zipCode': zipCode,
      'streetName': streetName,
      'number': number,
      'complement': complement ?? '',
      'district': district,
      'city': city,
      'state': state,
      'country': country,
      'reference': reference ?? '',
      'latitud': latitud ?? '',
      'longitud': longitud ?? '',
      'obs': obs ?? '',
    };
  }
}
