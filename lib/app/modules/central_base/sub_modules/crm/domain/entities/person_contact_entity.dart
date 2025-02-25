import '../../../../../shared/enums/enums.dart';

class PersonContactEntity {
  final int? idContact;
  final EnumTypeContact typeContact;
  final String? descriptionContact;
  final String? informationContact;

  PersonContactEntity(
    this.idContact,
    this.typeContact,
    this.descriptionContact,
    this.informationContact,
  );
}
