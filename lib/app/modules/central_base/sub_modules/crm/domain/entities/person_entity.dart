import '../../../../../shared/enums/enums.dart';

class PersonEntity {
  final String nameOrCorporateName;
  final String nickNameOrFantasyName;
  final EnumPersonType personType;
  final int idCorp;
  final int idCompanyCorp;
  final List<Map<String, dynamic>>? listDocuments;
  final List<Map<String, dynamic>>? listAdresses;
  final List<Map<String, dynamic>>? listContacts;

  const PersonEntity({
    required this.nameOrCorporateName,
    required this.nickNameOrFantasyName,
    required this.personType,
    required this.idCorp,
    required this.idCompanyCorp,
    this.listDocuments,
    this.listAdresses,
    this.listContacts,
  });
}
