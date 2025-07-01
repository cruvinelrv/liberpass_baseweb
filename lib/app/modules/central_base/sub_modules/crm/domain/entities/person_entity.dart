import 'package:liberpass_shared/liberpass_shared.dart';

class PersonEntity {
  final int? internalCode;
  final EnumTypePersonEnum personType;
  final String documentReference;
  final String nameOrSocialReason;
  final String nickNameOrFantasyName;
  final int idCorp;
  final int idCompanyCorp;
  final String? bornOrFoundationDate;
  final String? bornCity;
  final String? bornState;
  final String? bornCountry;
  final List<Map<String, dynamic>>? listDocuments;
  final List<Map<String, dynamic>>? listAddresses;
  final List<Map<String, dynamic>>? listContacts;

  const PersonEntity({
    this.internalCode,
    required this.personType,
    required this.documentReference,
    required this.nameOrSocialReason,
    required this.nickNameOrFantasyName,
    required this.idCorp,
    required this.idCompanyCorp,
    this.bornOrFoundationDate,
    this.bornCity,
    this.bornState,
    this.bornCountry,
    this.listDocuments,
    this.listAddresses,
    this.listContacts,
  });
}
