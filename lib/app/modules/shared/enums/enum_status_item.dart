// ignore_for_file: constant_identifier_names

enum EnumStatusItem {
  ATIVO(idStatusItem: 1, nameStatusItem: 'ATIVO'),
  INATIVO(idStatusItem: 2, nameStatusItem: 'INATIVO'),
  SUSPENSO(idStatusItem: 3, nameStatusItem: 'SUSPENSO');

  final int idStatusItem;
  final String nameStatusItem;
  const EnumStatusItem({
    required this.idStatusItem,
    required this.nameStatusItem,
  });
}
